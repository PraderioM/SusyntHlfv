#___________________________________________________________
def isTight_std(l):
    "tight with standard isolation"
    return elecIsTight_std  (l) if l.isEl else muonIsTight_std  (l) if l.isMu else False
def isTight_tight(l):
    "tight with standard isolation, but tighter cuts"
    return elecIsTight_tight(l) if l.isEl else muonIsTight_tight(l) if l.isMu else False
def isTight_minden(l):
    "tight with modified isolation: denominator=min(pt,60) rather than pt"
    return elecIsTight_minden(l) if l.isEl else muonIsTight_minden(l) if l.isMu else False
def isTight_wh (l):
    "tight with tighter cuts and modified isolation"
    return elecIsTight_wh   (l) if l.isEl else muonIsTight_wh   (l) if l.isMu else False

def elecIsTight_std   (l): return l.isTightPp and elecIsFromPv(l) and elecIsIsolated(l, denominator_std(l), etConeThres=0.18, ptConeThres=0.16)
def elecIsTight_tight (l): return l.isTightPp and elecIsFromPv(l) and elecIsIsolated(l, denominator_std(l), etConeThres=0.13, ptConeThres=0.07)
def elecIsTight_minden(l): return l.isTightPp and elecIsFromPv(l) and elecIsIsolated(l, denominator_wh (l), etConeThres=0.18, ptConeThres=0.16)
def elecIsTight_wh    (l): return l.isTightPp and elecIsFromPv(l) and elecIsIsolated(l, denominator_wh (l), etConeThres=0.13, ptConeThres=0.07)

def muonIsTight_std   (l): return muonIsFromPv(l) and muonIsIsolated(l, denominator_std(l), etConeThres=None, ptConeThres=0.12)
def muonIsTight_tight (l): return muonIsFromPv(l) and muonIsIsolated(l, denominator_std(l), etConeThres=0.14, ptConeThres=0.06)
def muonIsTight_minden(l): return muonIsFromPv(l) and muonIsIsolated(l, denominator_wh(l),  etConeThres=None, ptConeThres=0.12)
def muonIsTight_wh    (l): return muonIsFromPv(l) and muonIsIsolated(l, denominator_wh (l), etConeThres=0.14, ptConeThres=0.06)

def lepIsTight_std   (l): return muonIsTight_std   (l) if l.isMu else elecIsTight_std   (l)
def lepIsTight_tight (l): return muonIsTight_tight (l) if l.isMu else elecIsTight_tight (l)
def lepIsTight_minden(l): return muonIsTight_minden(l) if l.isMu else elecIsTight_minden(l)
def lepIsTight_wh    (l): return muonIsTight_wh    (l) if l.isMu else elecIsTight_wh    (l)

def denominator_wh (l) :
    pt = l.p4.Pt()
    return 1.0/min([pt, 60.0]) if pt>0.0 else None

def denominator_std(l) :
    pt = l.p4.Pt()
    return 1.0/pt if pt>0.0 else None

def elecIsFromPv(l):
    # maxD0Sig, maxZ0SinTheta = 3.0, 0.4 # see SusyNtTools::isSignalElectron, WH values
    maxD0Sig, maxZ0SinTheta = 5.0, 0.4 # see SusyNtTools::isSignalElectron, std values
    return abs(l.d0Signif) < maxD0Sig and abs(l.z0SinTheta) < maxZ0SinTheta

def muonIsFromPv(l):
    maxD0Sig, maxZ0SinTheta = 3.0, 1.0 # see SusyNtTools::isSignalMuon
    return abs(l.d0Signif) < maxD0Sig and abs(l.z0SinTheta) < maxZ0SinTheta

def elecIsIsolated(l, denom, etConeThres, ptConeThres):
    pt, etCone, ptCone = l.p4.Pt(), l.etConeCorr, l.ptConeCorr
    return ((etCone*denom < etConeThres if etConeThres else True) and
            (ptCone*denom < ptConeThres if ptConeThres else True)
            if denom else False)

def muonIsIsolated(l, denom, etConeThres, ptConeThres):
    pt, etCone, ptCone = l.p4.Pt(), l.etConeCorr, l.ptConeCorr # DG: Nt uses ptConeCorr only for 3lep?
    return ((etCone*denom < etConeThres if etConeThres else True) and
            (ptCone*denom < ptConeThres if ptConeThres else True)
            if denom else False)
