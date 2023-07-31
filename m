From: Yu Zhao <yuzhao@google.com>
Date: Mon, 31 Jul 2023 14:35:29 -0600
Subject: [PATCH] KVM: Wrap kvm_{gfn,hva}_range.pte in a per-action union
In-Reply-To: <20230729004144.1054885-1-seanjc@google.com>
References: <20230729004144.1054885-1-seanjc@google.com>
Message-ID: <CAOUHufaK1zibYzOxUGWgYatLnts+fOG6X8fBAwtGA_S6cdDxMw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 28, 2023 at 6:41?PM Sean Christopherson <seanjc@google.com> wrote:
>
> Wrap kvm_{gfn,hva}_range.pte in a union so that future notifier events can
> pass event specific information up and down the stack without needing to
> constantly expand and churn the APIs.  Lockless aging of SPTEs will pass
> around a bitmap, and support for memory attributes will pass around the
> new attributes for the range.
>
> Add a "KVM_NO_ARG" placeholder to simplify handling events without an
> argument (creating a dummy union variable is midly annoying).
>
> Opportunstically drop explicit zero-initialization of the "pte" field, as
> omitting the field (now a union) has the same effect.
>
> Cc: Yu Zhao <yuzhao@google.com>
> Link: https://lore.kernel.org/all/CAOUHufagkd2Jk3_HrVoFFptRXM=hX2CV8f+M-dka-hJU4bP8kw at mail.gmail.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Acked-by: Yu Zhao <yuzhao@google.com>

