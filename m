From: Reiji Watanabe <reijiw@google.com>
Date: Mon, 8 Nov 2021 22:36:19 -0800
Subject: [PATCH v5.5 08/30] KVM: arm64: Use "new" memslot instead of
 userspace memory region
In-Reply-To: <20211104002531.1176691-9-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-9-seanjc@google.com>
Message-ID: <CAAeT=FxcFq2SoM5xRYJfB=bBzGrY1uuEUhvFd+6sb86y-rg_Yw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 3, 2021 at 5:26 PM Sean Christopherson <seanjc@google.com> wrote:
>
> Get the slot ID, hva, etc... from the "new" memslot instead of the
> userspace memory region when preparing/committing a memory region.  This
> will allow a future commit to drop @mem from the prepare/commit hooks
> once all architectures convert to using "new".
>
> Opportunistically wait to get the hva begin+end until after filtering out
> the DELETE case in anticipation of a future commit passing NULL for @new
> when deleting a memslot.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Reiji Watanabe <reijiw@google.com>

