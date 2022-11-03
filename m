From: Philippe Mathieu-Daudé <philmd@linaro.org>
Date: Thu, 3 Nov 2022 08:18:12 +0100
Subject: [PATCH 27/44] KVM: Drop kvm_arch_{init,exit}() hooks
In-Reply-To: <20221102231911.3107438-28-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-28-seanjc@google.com>
Message-ID: <1da0b1fa-ca20-4370-26b4-9f18ab8ac95d@linaro.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/11/22 00:18, Sean Christopherson wrote:
> Drop kvm_arch_init() and kvm_arch_exit() now that all implementations
> are nops.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/arm64/kvm/arm.c                | 11 -----------
>   arch/mips/kvm/mips.c                | 10 ----------
>   arch/powerpc/include/asm/kvm_host.h |  1 -
>   arch/powerpc/kvm/powerpc.c          |  5 -----
>   arch/riscv/kvm/main.c               |  9 ---------
>   arch/s390/kvm/kvm-s390.c            | 10 ----------
>   arch/x86/kvm/x86.c                  | 10 ----------
>   include/linux/kvm_host.h            |  3 ---
>   virt/kvm/kvm_main.c                 | 19 ++-----------------
>   9 files changed, 2 insertions(+), 76 deletions(-)

Reviewed-by: Philippe Mathieu-Daud? <philmd@linaro.org>


