From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 22 Mar 2023 20:28:56 +0100
Subject: [PATCH 0/2] RISC-V: KVM: Require alternatives
Message-ID: <20230322192858.1189272-1-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

KVM makes use of riscv_has_extension_unlikely() to check for the
svinval extension. riscv_has_extension_unlikely() is built on
alternatives, which means KVM should ensure alternatives support
is available.

The first patch takes the opportunity to cleanup KVM's select
list. The second patch selects RISCV_ALTERNATIVE.

Thanks,
drew

Andrew Jones (2):
  RISC-V: KVM: Alphabetize selects
  RISC-V: KVM: Require alternatives

 arch/riscv/kvm/Kconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.39.2


