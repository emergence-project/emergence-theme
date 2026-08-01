# Emergence — Glacier / Galaxy Preset Design System

## 목표

이 프리셋은 빙하와 우주 사진을 장식 배경이 아니라 **공간을 정의하는 주 시각
자산**으로 사용한다. 라이트 모드는 Glacier, 다크 모드는 Galaxy이며,
각 환경의 빛과 밀도에서 표면·명암·타이포그래피·상호작용 규칙을 도출한다.
사진은 프리셋의 정체성을 담당하지만, 실제 읽기 구간에서는 저채도 중립 표면과
Trace 중심 구조를 사용해 콘텐츠가 항상 먼저 보이게 한다.

과거 브랜치 `orginal-emergence-deep-glacier-stellar-blue`의 이미지와
`emergence.` 중심 구성을 계승하되, 현재 템플릿의 Projects, Notes, Readings,
About 정보 구조와 콘텐츠 계약을 유지한다. 프리셋은 neutral 기본 디자인을 런타임에
겹치는 제3의 테마가 아니라, 설치 시 선택하는 완전한 시각 시스템이다.

## 환경 원칙

| 환경 | 사진에서 가져온 성질 | 시스템 표현 |
|---|---|---|
| Glacier | 넓은 수평선, 확산광, 차가운 공기, 낮은 대비 | near-white reading surface, charcoal 본문, 낮은 채도의 blue-grey accent |
| Galaxy | 고밀도 별빛, 심우주의 깊이, 차가운 점광원 | near-black reading surface, off-white 본문, 낮은 채도의 ice-blue accent |

두 환경은 같은 정보 구조와 컴포넌트를 공유하지만 동일한 색상 반전으로 취급하지
않는다. 투명도, 그림자, 테두리, 이미지 크롭은 각 사진에 맞게 독립적으로 조정한다.

## 형태 문법 — Field, Plane, Trace, Point

이 시스템은 glassmorphism에서 출발하지 않는다. 빙하와 우주가 만드는 환경을 먼저
두고, 그 환경을 가리지 않으면서 탐색하고 읽기 위한 최소한의 인터페이스를 만든다.

> **Landscape for identity, content for attention.**
> 사진은 환경이고, 인터페이스는 환경을 관측하는 장치다. 히어로를 지난 뒤에는
> 표면과 색이 물러나고 콘텐츠가 시선의 중심이 된다.

모든 시각 요소는 `Field`, `Plane`, `Trace`, `Point` 중 하나의 역할을 가져야 한다.
어느 역할에도 속하지 않는 형태는 장식으로 간주하고 추가하지 않는다.

이 절은 형태를 결정하는 구현 계약이다. 활성 컴포넌트는 이 역할 문법과 계층을
따르며, 새 공용 컴포넌트도 같은 검증 질문을 통과해야 한다.

### 1. Field — 연속된 환경

`Field`는 Glacier 또는 Galaxy 사진이 만드는 끊기지 않는 공간이다.

- 사진은 페이지 배경이 아니라 사이트 전체를 연결하는 환경이다.
- 히어로와 큰 워드마크는 별도 박스 없이 Field 위에 직접 놓는다.
- 화면을 여러 불투명 카드로 분절하지 않는다.
- 대비는 사진을 지우는 덮개보다 gradient veil, text shadow, optical surface로
  해결한다.
- 페이지가 바뀌어도 같은 환경이 이어지는 느낌을 유지한다.

Field 위에 직접 놓을 수 있는 요소는 큰 워드마크, 짧은 환경 라벨, 태그라인처럼
내용이 짧고 대비를 안정적으로 확보할 수 있는 요소로 제한한다.

### 2. Plane — 빙하의 층과 관측창

`Plane`은 Field 위에서 콘텐츠를 읽거나 기능을 묶기 위한 반투명 표면이다. 박스는
장식이 아니라 명확한 기능적 경계를 의미한다.

다음 조건 중 하나 이상을 충족할 때만 Plane을 만든다.

1. 사진 위에서 지속적인 읽기 대비가 필요하다.
2. 여러 요소가 하나의 기능 단위로 함께 작동한다.
3. 하나의 독립된 선택 또는 이동 대상이다.
4. 주변과 다른 스크롤·고정·상호작용 문맥을 가진다.

조건을 충족하지 않는 단순한 정보 묶음은 박스 대신 여백이나 Trace로 구분한다.

#### Plane 계층

| 계층 | 역할 | 기본 형태 |
|---|---|---|
| Atmospheric plane | 프로젝트 인덱스 등 환경 탐색을 위한 주요 영역 | 6px 반경, 높은 읽기 대비 |
| Reading plane | 긴 프로젝트 본문 | 6px 반경, 가장 높은 가독성 |
| Instrument panel | TOC, 필터, 보조 탐색 | 4px 반경, 주요 영역보다 낮은 위계 |
| Item plane | 별도 표면이 꼭 필요한 독립 도구 | 4px 반경, 예외적으로만 사용 |
| Compact control | 하나의 짧은 행동을 수행하는 버튼 | 2px 또는 Point; capsule은 사용하지 않음 |

Plane은 기본적으로 한 단계만 사용한다. 기능상 필요한 Instrument만 한 단계 더
허용하며, 프로젝트·노트·리딩처럼 반복되는 항목은 Plane 대신 Trace 행으로
표현한다.

```text
Field
└── Atmospheric 또는 Reading plane
    └── 필요한 경우에만 Instrument panel
```

반복 항목이나 세 번째 박스 계층이 필요해 보인다면 먼저 여백, 타이포그래피,
Trace로 해결한다.

### 3. Trace — 빙하의 수평선

`Trace`는 위치, 선택, 분리, 연속성을 나타내는 얇은 선이다. 빙하 사진의 넓은
수평선에서 형태를 가져온다.

Trace는 다음 요소에 사용한다.

- 상단 내비게이션의 활성 위치
- 프로젝트 카테고리 탭
- 섹션 구분
- 콘텐츠의 진행 방향
- 표면의 광학 경계

규칙은 다음과 같다.

- 두께는 기본 1px, 활성 상태는 최대 2px로 제한한다.
- 선은 정보를 구분하거나 현재 위치를 표시할 때만 사용한다.
- 단순 장식용 선을 추가하지 않는다.
- 활성 Trace는 텍스트 전체를 장식하기보다 선택된 영역의 축을 명확히 보여준다.
- Glacier에서는 낮은 대비의 blue-grey Trace를 사용한다.
- Galaxy에서도 Trace는 대부분 중립색을 사용하고, 활성 위치만 ice-blue로 표시한다.

### 4. Point — 별과 환경 제어 장치

`Point`는 상태, 초점, 현재 위치 또는 하나의 독립된 제어를 나타낸다. Galaxy
Field의 별과 관측 장비의 indicator에서 형태를 가져온다.

Point는 다음 요소에만 사용한다.

- 테마 전환 버튼
- 프로젝트 상태점
- 현재 위치 또는 선택 표시
- 키보드 focus 신호
- `emergence.`의 마침표

규칙은 다음과 같다.

- 원형은 하나의 상태나 행동을 나타낼 때만 사용한다.
- 여러 항목을 담는 구조적 컨테이너를 원형이나 capsule로 만들지 않는다.
- Galaxy의 glow는 `emergence.`의 마침표처럼 정체성을 나타내는 핵심 Point
  한 곳에만 허용한다.
- Glacier에서는 glow를 사용하지 않고 얇은 경계와 낮은 확산 그림자를 사용한다.
- 상태를 색상만으로 전달하지 않고 텍스트나 아이콘을 함께 제공한다.
- 프로젝트 상태색은 의미 구분을 위한 저채도 예외이며, 일반 링크나 장식에는
  재사용하지 않는다.

## 형태 선택 규칙

형태는 컴포넌트 이름이 아니라 역할에서 결정한다.

| 요소 | 형태 문법 | 도출되는 형태 |
|---|---|---|
| 홈페이지 히어로 | Field | 박스 없는 열린 구성 |
| 상단 내비게이션 | Plane + Trace | 화면 폭 전체의 플러시 Horizon Rail (반경 없음) |
| 테마 전환 | Point | 원형 환경 제어 장치 |
| 프로젝트 인덱스 | Atmospheric plane | 하나의 넓은 반투명 표면 |
| 프로젝트 목록 | Trace | 하나의 Plane 안에서 1px rule로 나뉜 행 |
| 프로젝트 탭 | Trace | 텍스트와 수평 활성선 |
| Notes 인덱스 | Atmospheric plane + Trace | 하나의 표면 안에서 행 단위로 구분된 기록 목록 |
| Readings 인덱스 | Reading plane + Trace | 하나의 표면 안에서 행 단위로 구분된 읽기 목록 |
| About | Reading plane | 하나의 연속된 읽기 표면 |
| 프로젝트 본문 | Reading plane | 대비가 높은 장문 표면 |
| TOC | Instrument panel | 본문에 종속된 보조 표면 |
| `explore the system` | Trace | 텍스트와 얇은 하단선으로 된 단일 cue |

### 반경 규칙

반경은 장식 강도가 아니라 요소의 역할을 나타낸다.

- `radius-atmosphere`: 기본값 6px
  페이지의 주요 Atmospheric 또는 Reading plane에만 사용한다.
- `radius-panel`: 기본값 4px
  기능적으로 독립된 Instrument panel에 사용한다.
- `radius-control`: 기본값 2px
  하나의 짧은 행동을 수행하는 compact control에만 사용한다.
- `radius-point`: 50%
  상태와 단일 환경 제어에만 사용한다.

`radius-control`과 `radius-point`도 CSS token으로 유지해 형태 역할이 코드에
직접 드러나게 한다.

넓은 구조적 컨테이너에는 `999px` capsule 반경을 사용하지 않는다.

## Horizon Rail — 상단 내비게이션

상단바는 일반적인 glass navbar가 아니라 사진의 수평선 위에 놓인 **Horizon
Rail**이다. 사용자가 환경 속에서 현재 위치를 확인하고 다른 영역으로 이동하는 관측
레일 역할을 한다.

### 형태

- 뷰포트 좌우 끝까지 붙는 화면 폭 전체의 낮은 Plane을 사용한다 (`border-radius: 0`).
- 콘텐츠 축과 정렬된 좌우 padding만 두고, 별도의 여백이나 캡슐 형태로 띄우지 않는다.
- 높이와 시각적 무게를 최소화해 사진과 히어로보다 앞서 보이지 않게 한다.
- 하단 1px 테두리가 Horizon Trace 역할을 하며, 별도의 장식선을 중복해서 사용하지 않는다.

### 상태

#### Hero state

홈페이지 첫 장면에서 사용한다.

- 배경 투명도와 그림자를 가장 낮게 유지한다.
- 빙하의 하늘과 우주의 별이 Rail을 통해 충분히 보여야 한다.
- 작은 `emergence.`는 위치를 알려주는 orientation label이고, 큰 히어로 워드마크는
  장면의 주제다.
- 두 워드마크가 경쟁하지 않도록 크기, 대비, 시각적 밀도를 분명하게 구분한다.
- 프로젝트 인덱스에 도달하기 전에는 `projects` 활성 Trace를 표시하지 않는다.

#### Content state

내부 페이지 또는 콘텐츠가 시작되는 영역에서 사용한다.

- 읽기와 탐색에 필요한 수준으로 optical surface를 강화한다.
- 구조와 크기는 Hero state와 같게 유지하고 투명도·경계·그림자만 변경한다.
- 상태 변화로 레이아웃이 움직이지 않게 한다.

### 내비게이션 역할

- `emergence.` 로고는 페이지 또는 환경의 시작점으로 이동한다.
- `projects`는 프로젝트 인덱스로 이동한다.
- `notes`와 `readings`는 각 컬렉션의 연속된 인덱스 Plane으로 이동한다.
- `about`은 About reading plane으로 이동한다.
- 로고와 `projects`가 동일한 목적지를 가리키지 않게 한다.
- 활성 메뉴는 Horizon Trace로 표시한다.
- 테마 토글만 Point 형태의 원형 제어로 유지한다.

### 테마 전환 제어

테마 토글은 단순한 장식 아이콘이 아니라 Glacier와 Galaxy 사이를
이동하는 환경 제어 장치다.

- 현재 환경이 아니라 이동할 환경을 아이콘과 접근성 이름으로 설명한다.
- Glacier에서는 `Switch to Galaxy`를 제공한다.
- Galaxy에서는 `Switch to Glacier`를 제공한다.
- hover에서는 경계와 빛만 변하고 버튼이 크게 이동하지 않는다.
- 키보드 focus는 두 환경에서 모두 명확해야 한다.

### 모바일

- Horizon Rail 자체가 아래로 확장되며 별도의 떠 있는 메뉴 카드를 만들지 않는다.
- 열린 메뉴는 동일한 Plane의 연장으로 보여야 한다.
- 메뉴가 열려도 테마 토글과 현재 위치를 잃지 않는다.
- 확장 상태는 `aria-expanded`와 시각적 형태가 일치해야 한다.
- 테마 Point와 메뉴 제어는 36px 시각 크기를 유지하되 실제 터치 영역은 최소
  44px로 확장한다.
- 텍스트 탐색 링크도 capsule이나 새 Plane을 만들지 않고 최소 44px 높이의 터치
  영역을 제공한다.

## 환경별 광학 변환

Glacier와 Galaxy는 동일한 구조와 형태 문법을 공유한다. 테마가 바뀔 때
컴포넌트의 기하 구조는 변하지 않고 광학 처리만 달라진다.

### Glacier

- near-white에 가까운 높은 대비의 reading surface
- charcoal 텍스트
- 작고 낮은 중립 그림자
- 낮은 채도의 blue-grey accent 한 색
- glow 없음
- 수평선과 넓은 여백을 강조

### Galaxy

- near-black reading surface
- off-white 텍스트
- 저채도 ice-blue 활성 Trace
- `emergence.`의 마침표에만 허용되는 약한 starlight glow
- 작고 낮은 그림자와 높은 읽기 표면 대비
- 별과 은하수의 밀도를 가리지 않는 투명도

## 상호작용과 움직임

움직임은 표면의 물리적 깊이를 설명해야 하며 주의를 끌기 위한 장식으로 사용하지
않는다.

- 반복 항목과 compact control은 상승 이동을 사용하지 않는다.
- Atmospheric plane, Reading plane, Horizon Rail은 hover로 이동하지 않는다.
- 고정된 구조는 텍스트와 경계색 변화로만 반응한다.
- transition은 기본 180–220ms 범위에서 사용한다.
- 첫 화면에서 사진이 즉시 드러나도록 page-load fade는 사용하지 않는다.
- `prefers-reduced-motion`에서는 모든 위치 이동을 제거한다.
- `prefers-reduced-transparency`에서는 표면 blur를 제거하고 현재 테마의 읽기
  대비를 유지한다.
- 키보드 focus는 hover보다 명확하고 두 테마에서 동일한 의미를 가져야 한다.

## 금지되는 패턴

- 이유 없이 모든 콘텐츠를 개별 glass card로 감싸는 것
- 넓은 레이아웃 컨테이너를 capsule로 만드는 것
- 박스 안에 다시 박스를 반복해 사진을 가리는 것
- Galaxy의 glow를 모든 테두리와 텍스트에 적용하는 것
- Glacier를 Galaxy의 단순한 색상 반전으로 만드는 것
- 활성 상태와 장식 accent를 구분하지 않는 것
- 테마에 따라 컴포넌트의 크기나 배치가 달라지는 것
- 독립적인 행동이 아닌 텍스트 묶음에 pill 형태를 사용하는 것

## 새 요소를 추가할 때의 검증 질문

새로운 컴포넌트나 장식을 추가하기 전에 다음 질문에 모두 답해야 한다.

1. 이 요소는 Field, Plane, Trace, Point 중 무엇인가?
2. 이 요소를 박스로 감싸야 하는 기능적 이유가 있는가?
3. 어떤 표면 계층에 속하며 기존 표면과 불필요하게 중첩되지 않는가?
4. 반경과 형태가 역할 규칙에서 도출되는가?
5. Glacier와 Galaxy에서 구조는 유지되고 광학 처리만 달라지는가?
6. hover, focus, active 상태가 서로 다른 의미로 식별되는가?
7. 이 요소를 제거해도 정보 구조가 유지된다면 단순 장식은 아닌가?

## 레이어 구조

화면은 다음 다섯 레이어로 구성한다.

1. **Environment** — `bg-light.jpg` 또는 `bg-dark.jpg`가 뷰포트를 채운다.
2. **Atmospheric veil** — 이미지의 상단은 최대한 보존하고, 콘텐츠가 누적되는 하단만
   점진적으로 어둡거나 밝게 만들어 대비를 확보한다.
3. **Optical surface** — 내비게이션과 읽기 영역은 반투명·blur·얇은 광학 경계를
   사용한다. glass는 사진을 숨기는 불투명 카드가 아니라 읽을 수 있게 굴절시키는
   매개다.
4. **Content** — 프로젝트, 본문, 상태 정보는 환경 위에서도 명확한 위계를 유지한다.
5. **Light signature** — 저채도 accent는 활성 위치와 핵심 Point에만 사용한다.
   반복 항목과 일반 본문에는 glow를 사용하지 않는다.

## 레이아웃

### 홈페이지

- 첫 화면은 사진과 큰 `emergence.` 워드마크가 주인공이다.
- 짧은 연구 태그라인과 프로젝트로 내려가는 단일 cue만 함께 둔다.
- 프로젝트 목록은 첫 환경 장면 아래 하나의 큰 atmospheric surface 안에 배치한다.
- `research`와 `systems` 탭, 프로젝트 상태, 링크 동작은 기존 계약을 유지한다.
- 프로젝트는 중첩 카드가 아니라 1열 Trace 행으로 표시하며 하나의 주 이동 링크만
  둔다. 이동 링크는 제목 자체에 걸고 별도의 `view project` 버튼을 만들지 않는다.
- 긴 제목은 줄바꿈해서 상태 Point를 밀어내지 않고 말줄임으로 처리한다.

### 컬렉션 인덱스, About, 본문

- 사진은 모든 페이지에서 연속된 환경으로 남는다.
- About는 하나의 넓은 reading surface를 사용한다.
- Notes와 Readings는 항목마다 별도 카드를 만들지 않는다. 각 컬렉션 전체를 하나의
  Atmospheric 또는 Reading plane으로 묶고, 그룹과 행 사이를 Trace로 구분한다.
- 프로젝트·노트·리딩 본문은 TOC surface와 reading surface를 분리해 긴 글의
  가독성을 확보한다.
- TOC가 없거나 실제 제목이 없으면 빈 Instrument panel 자리를 남기지 않고 reading
  surface를 단일 열로 정렬한다.
- 콘텐츠가 길어져도 완전 불투명한 흰색/검정 페이지로 전환하지 않는다.

## 타이포그래피

- 글꼴은 세 갈래로 역할이 고정되어 있다.
  - Inter — 모든 제목과 UI 텍스트.
  - JetBrains Mono — 환경 라벨·태그라인 등 메타데이터 요소.
  - Source Serif 4 — 프로젝트 본문 prose 전용. 대비가 낮고 x-height가 커서
    화면에서 가볍게 읽히며, 폴백 체인(`STIX Two Text` → `Georgia`)이
    MathJax 수식과도 자연스럽게 어울린다. 다른 곳에는 쓰지 않는다.
  세 글꼴은 `_layouts/base.html`에서 Google Fonts로 불러오고, 시스템 스택을
  fallback으로 유지한다.
- `emergence.`와 페이지 타이틀은 Thin/Light를 사용해 사진의 넓은 공간과 호흡한다.
- 프로젝트 제목과 본문 섹션 제목은 Semibold, 본문 prose는 Regular로 위계를
  나눈다.
- 환경 라벨과 태그라인에만 모노스페이스와 넓은 자간을 제한적으로 사용한다.
- 실제로 읽는 본문(`.post-body`, `.section-content`)은 항상
  `--color-text-primary`를 쓴다 — 회색(secondary/tertiary)은 메타데이터·
  라벨·"아직 활성화되지 않음"을 나타낼 때만 쓰고, 정독 대상 텍스트를
  흐리지 않는다.
- Galaxy에서는 text shadow가 사진의 밝은 별 위 대비를 보호하고, Glacier에서는
  흰 확산광 shadow가 짙은 글자를 분리한다.

## 표면과 상호작용

- 큰 reading surface는 6px, 기능적 내부 panel은 4px 반경을 기본으로 한다.
- hover는 위치 이동이나 glow 없이 텍스트와 경계색만 바꾼다.
- Galaxy glow는 `emergence.`의 마침표처럼 정체성을 나타내는 핵심 Point
  한 곳에만 사용한다.
- Glacier는 glow 없이 작고 낮은 중립 그림자를 사용한다.
- 키보드 focus는 배경과 관계없이 식별 가능한 외곽선을 제공한다.
- `prefers-reduced-motion`에서도 레이아웃은 정적으로 유지된다.

## 이미지와 크롭

- 프리셋 자산:
  - `assets/bg-light.jpg`, `bg-dark.jpg` — 호환성용 JPEG fallback
  - `assets/bg-{light,dark}-{1920,3840}.avif` — 우선 전송되는 해상도별
    AVIF 파생본
  - `assets/bg-{light,dark}-{1920,3840}.webp` — AVIF를 지원하지 않는
    브라우저를 위한 WebP 파생본
  - `assets/social-preview.jpg` — 두 환경을 함께 보여주는 템플릿 공유 카드
- 설치 후 자산은 테마의 `assets/img/common/` 아래에 놓인다.
- CSS `image-set()`이 파일 형식과 화면 밀도에 맞는 배경을 선택하며, 이를 지원하지
  않는 브라우저는 JPEG fallback을 사용한다.
- 데스크톱은 이미지 중앙 구도를 기본으로 한다.
- 모바일은 주 피사체가 남도록 테마별 `bg-position-mobile` 토큰을 사용한다.
- Glacier의 저작자·CC BY 4.0 표기와 Galaxy의 출처 표시는 환경별 footer에 유지한다.
- 이미지 위 대비는 사진 자체를 흐리거나 과도하게 덮지 않고 gradient veil과
  optical surface에서 해결한다.

## 정보 구조 계약

프로젝트에는 두 축이 있다.

1. `project_type`
   - `research`
   - `systems`
2. `status`
   - `completed`
   - `in-progress`
   - `planned`

`completed`만 링크 가능한 카드이며, `published: false`는 표시하지 않는다. 이 계약은
`index.html`, `_includes/project-card.html`, 프로젝트 SCSS 사이에서 동일하게 유지한다.

Notes와 Readings는 각각 `site.notes`, `site.readings` 컬렉션과 `subcategory`,
`published`, permalink 계약을 그대로 사용한다. 프리셋은 콘텐츠 모델이나 URL을
변경하지 않고 표면 구성만 교체한다.

## 테마 토큰

색상과 환경 토큰의 원본은 `_data/theme_dark.yml`과 `_data/theme_light.yml`이다.
`_sass/emergence/_variables.scss`에는 Jekyll 데이터가 없을 때를 위한 동일한 fallback이
있다.

환경 전용 토큰은 다음을 포함한다.

- `bg-image`, `bg-position`, `bg-position-mobile`
- `bg-overlay-page`, `bg-overlay-page-opacity`
- `surface-filter`, `surface-filter-nav`, `surface-filter-nav-hero`
- `color-bg-nav-hero`, `color-nav-border-hero`, `color-bg-nav-hero-shadow`
- `color-bg-glass`, `color-panel-inner`, `color-reading-surface`,
  `color-sidebar-surface`
- `shadow-card`, `shadow-panel`, `shadow-glow-*`, `shadow-status-point`
- `radius-atmosphere`, `radius-panel`, `radius-control`, `radius-point`

## 오픈소스 템플릿 경계

`emergence-theme`의 루트는 neutral flat editorial 시스템을 기본값으로 유지한다.
이 디렉터리는 이미지, 93개 환경 토큰, Sass, 레이아웃, include, 컬렉션 인덱스를 함께
제공하는 선택형 `glacier-stellar` 프리셋이다. 설치 후에도 라이트/다크 전환은
Glacier와 Galaxy 사이의 유일한 런타임 환경 제어이며, 프리셋 자체를
선택하는 별도 런타임 UI는 만들지 않는다.
