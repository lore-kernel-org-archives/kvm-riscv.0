From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 8 Oct 2021 09:24:58 +0200
Subject: [PATCH v3 1/5] RISC-V: Mark the existing SBI v0.1 implementation
 as legacy
In-Reply-To: <20211008032036.2201971-2-atish.patra@wdc.com>
References: <20211008032036.2201971-1-atish.patra@wdc.com>
 <20211008032036.2201971-2-atish.patra@wdc.com>
Message-ID: <1616f9d2-5530-1266-6734-b5d64cb20658@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 08/10/21 05:20, Atish Patra wrote:
> The existing SBI specification impelementation follows v0.1 or legacy
> specification. The latest specification known as v0.2 allows more
> scalability and performance improvements.
> 
> Rename the existing implementation as legacy and provide a way to allow
> future extensions.
> 
> Signed-off-by: Atish Patra<atish.patra@wdc.com>
> ---
>   arch/riscv/include/asm/kvm_vcpu_sbi.h |  29 +++++
>   arch/riscv/kvm/vcpu_sbi.c             | 149 ++++++++++++++++++++------
>   2 files changed, 148 insertions(+), 30 deletions(-)
>   create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi.h

It's bikeshedding I know, but still: every time somebody calls something 
"legacy", a kitten dies.  Please use kvm_sbi_ext_0_1_handler and 
vcpu_sbi_ext_0_1.

Paolo


