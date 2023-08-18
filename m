From: Sean Christopherson <seanjc@google.com>
Date: Thu, 17 Aug 2023 17:08:36 -0700
Subject: [PATCH] KVM: Wrap kvm_{gfn,hva}_range.pte in a per-action union
In-Reply-To: <20230729004144.1054885-1-seanjc@google.com>
References: <20230729004144.1054885-1-seanjc@google.com>
Message-ID: <169229683179.1234886.15097906251075154792.b4-ty@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 28 Jul 2023 17:41:44 -0700, Sean Christopherson wrote:
> Wrap kvm_{gfn,hva}_range.pte in a union so that future notifier events can
> pass event specific information up and down the stack without needing to
> constantly expand and churn the APIs.  Lockless aging of SPTEs will pass
> around a bitmap, and support for memory attributes will pass around the
> new attributes for the range.
> 
> Add a "KVM_NO_ARG" placeholder to simplify handling events without an
> argument (creating a dummy union variable is midly annoying).
> 
> [...]

Applied to kvm-x86 generic, with KVM_MMU_NOTIFIER_NO_ARG as suggested by Oliver.

[1/1] KVM: Wrap kvm_{gfn,hva}_range.pte in a per-action union
      https://github.com/kvm-x86/linux/commit/3e1efe2b67d3

--
https://github.com/kvm-x86/linux/tree/next
https://github.com/kvm-x86/linux/tree/fixes

