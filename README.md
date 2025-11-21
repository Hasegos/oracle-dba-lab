# 📚 Oracle SQL Practice for DBA

> 이 저장소는 **DBA(Database Administrator) 관점**에서 Oracle 데이터베이스 환경을 기반으로 SQL 실력을 체계적으로 향상시키기 위해 구성된 학습 공간입니다.<br>
> **프로그래머스 SQL Kit 문제 풀이** 와 **핵심 구문 정리(Cheatsheet)** 를 병행하며 실무 및 테스트 환경에 필요한 쿼리 작성 능력을 강화합니다.

---

## 🎯 프로젝트 목표 (Goals)

1. **DBA 지향 역량 기반 구축**: `ROWNUM`, `TO_CHAR` 등 Oracle 환경에 특화된 구문을 익히고, 나아가 **성능 및 관리 효율성을 고려한 쿼리 작성 원칙**을 학습합니다.
2. **체계적인 학습 기록 및 포트폴리오 강화**: 모든 문제 풀이 코드를 테스트 환경 구축(DDL/DML)과 함께 기록하며, **실무 지향의 코딩 및 문서화 표준**을 프로젝트 전반에 적용합니다.

---

## 🛠️ 기술 스택 (Tech Stack)

| 구분 | 내용 |
| :---: | :--- |
| **언어 (Language)** | SQL |
| **데이터베이스 (DB)** | Oracle (문제 환경 기준) |
| **코드 관리** | Git, Conventional Commits |
| **문서 형식** | Markdown |

---

## 📁 디렉토리 구조 및 목차 (Table of Contents)

이 저장소는 **두 가지 핵심 학습 영역**으로 구성됩니다. 상세 모듈 목록은 하위 폴더의 `README.md`를 참고부탁드립니다.

| 폴더명 | 학습 내용 | 비고 |
| :---: | :--- | :--- |
| **[`00_SQL_Cheatsheet`](./00_SQL_Cheatsheet/README.md)** | 주요 SQL 구문, 함수, Oracle 특화 문법 및 자주 쓰는 패턴 정리 | 핵심 참고 자료 |
| **[`01_Programmers`](./01_Programmers/README.md)** | 프로그래머스 SQL Kit 문제 풀이 모듈 | 메인 학습 기록 |

## 📜 코딩 및 문서화 규칙 (Standards)

### 1. 모듈별 문서화 (README)

모든 모듈 폴더 (`01_SELECT`, `02_SUM_MAX_MIN` 등) 내부에는 해당 모듈의 **상세 학습 목표 및 규칙**을 담은 **`README.md`** 파일이 포함됩니다.

### 2. SQL 파일 기록 표준 (4가지 필수 요소)

모든 `.sql` 파일은 **테스트 환경 구축 및 답안**을 모두 포함하며, 파일 상단에 **4가지 필수 기록 요소**를 주석 형태로 명시해야 합니다.

| No. | 기록 요소 | 역할 |
| :---: | :--- | :--- |
| **1** | 문제 명 및 난이도 | 문제 제목과 출처 명시 |
| **2** | 핵심 요구사항 요약 | 문제가 요구하는 조건 및 결과 정리 |
| **3** | 주요 기술 및 함수 | 문제 해결에 사용된 핵심 SQL 구문 (e.g., `NVL`, `ROWNUM`, `TO_CHAR`) |
| **4** | 구현 논리 및 단계 | 문제 분석부터 답안 도출까지의 사고 과정 |

### 3. 커밋 메시지 컨벤션

[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) 규약을 따르며, `Type(Scope): Subject` 형식으로 작성합니다.

| Type | Scope (범위) | 설명 | 예시 |
| :---: | :---: | :--- | :--- |
| **`feat`** | `(SELECT/L1)` | 새로운 문제 풀이 코드 추가 | `feat(SELECT/L1): Solve '2021년 가입 회원 수 구하기' (01)` |
| **`docs`** | `(ROOT)` 또는 `(SELECT)` | README 및 가이드라인 문서 추가/수정 | `docs(ROOT): Initialize main README structure` |
| **`fix`** | `(JOIN/L3)` | 기존 코드의 로직 오류 수정 | `fix(JOIN/L3): Correct HAVING clause logic in problem 05` |
| **`chore`** | `(CheatSheet)` | 치트 시트 내용 정리 및 업데이트 | `chore(CheatSheet): Update DATE and String function examples` |