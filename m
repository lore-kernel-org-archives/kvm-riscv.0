From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 Jun 2022 10:50:55 +0530
Subject: [GIT PULL] KVM/riscv fixes for 5.19, take #1
Message-ID: <CAAhSdy3BY551VEP5D-_vj7nzhb9O_k69v99jMdjQ+OxWZpxzpA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

Two minor fixes were missed in 5.19 merge window which include:
1) Typo fix in arch/riscv/kvm/vmid.c
2) Remove broken reference pattern from MAINTAINERS entry

Please pull.

Regards,
Anup

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-5.19-1

for you to fetch changes up to 1a12b25274b9e54b0d2d59e21620f8cf13b268cb:

  MAINTAINERS: Limit KVM RISC-V entry to existing selftests
(2022-06-09 09:18:22 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 5.19, take #1

- Typo fix in arch/riscv/kvm/vmid.c

- Remove broken reference pattern from MAINTAINERS entry

----------------------------------------------------------------
Julia Lawall (1):
      RISC-V: KVM: fix typos in comments

Lukas Bulwahn (1):
      MAINTAINERS: Limit KVM RISC-V entry to existing selftests

 MAINTAINERS           | 1 -
 arch/riscv/kvm/vmid.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

