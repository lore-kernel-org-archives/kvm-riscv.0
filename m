From: Sean Christopherson <seanjc@google.com>
Date: Tue, 4 Jun 2024 08:30:49 -0700
Subject: [PATCH] KVM: selftests: Fix RISC-V compilation
In-Reply-To: <20240604-e11569f6e3aa7675774628ed@orel>
References: <20240603122045.323064-2-ajones@ventanamicro.com> <20240604-e11569f6e3aa7675774628ed@orel>
Message-ID: <Zl8zKYynz1rgg1OX@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 04, 2024, Andrew Jones wrote:
> On Mon, Jun 03, 2024 at 02:20:46PM GMT, Andrew Jones wrote:
> > Due to commit 2b7deea3ec7c ("Revert "kvm: selftests: move base
> > kvm_util.h declarations to kvm_util_base.h"") kvm selftests now
> > requires implicitly including ucall_common.h when needed. The commit
>            ^ of course I meant 'explicitly' here. Gota love brain inversions
> and not reviewing commit messages closely until after posting... Should I
> post a v2 or just promise to buy a beer in exchange for a fixup-on-merge?

LOL, what kind of question is that?  Beer must be a lot cheaper in your neck of
the woods :-)

I'll grab this if no one jumps on it by tomorrow.

