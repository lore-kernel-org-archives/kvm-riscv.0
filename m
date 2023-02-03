From: Nicholas Piggin <npiggin@gmail.com>
Date: Fri, 03 Feb 2023 20:21:55 +1000
Subject: [PATCH 4/7] KVM: PPC: Standardize on "int" return types in the
 powerpc KVM code
In-Reply-To: <20230203094230.266952-5-thuth@redhat.com>
References: <20230203094230.266952-1-thuth@redhat.com>
 <20230203094230.266952-5-thuth@redhat.com>
Message-ID: <CQ8UPZX0BERP.2TFM4914IGJZF@bobo>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri Feb 3, 2023 at 7:42 PM AEST, Thomas Huth wrote:
> Most functions that are related to kvm_arch_vm_ioctl() already use
> "int" as return type to pass error values back to the caller. Some
> outlier functions use "long" instead for no good reason (they do not
> really require long values here). Let's standardize on "int" here to
> avoid casting the values back and forth between the two types.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks for the patch. It looks fine to me, it should be okay to
go via Paolo's tree if he's going to take the series.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/include/asm/kvm_ppc.h  | 14 +++++++-------
>  arch/powerpc/kvm/book3s_64_mmu_hv.c | 14 +++++++-------
>  arch/powerpc/kvm/book3s_64_vio.c    |  4 ++--
>  arch/powerpc/kvm/book3s_hv.c        |  6 +++---
>  arch/powerpc/kvm/book3s_pr.c        |  4 ++--
>  5 files changed, 21 insertions(+), 21 deletions(-)

