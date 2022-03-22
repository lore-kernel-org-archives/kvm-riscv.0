From: David Matlack <dmatlack@google.com>
Date: Tue, 22 Mar 2022 11:16:59 -0700
Subject: [PATCH v2 01/26] KVM: x86/mmu: Optimize MMU page cache lookup for
 all direct SPs
In-Reply-To: <YjBC1ZLio2iPkZ0V@xz-m1.local>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-2-dmatlack@google.com>
 <YjBC1ZLio2iPkZ0V@xz-m1.local>
Message-ID: <CALzav=dx2rm7xm07x0iEMiS1jzNoU2cOT-mtA9=P6C1riOe2AQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 15, 2022 at 12:40 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Mar 11, 2022 at 12:25:03AM +0000, David Matlack wrote:
> > Commit fb58a9c345f6 ("KVM: x86/mmu: Optimize MMU page cache lookup for
> > fully direct MMUs") skipped the unsync checks and write flood clearing
> > for full direct MMUs. We can extend this further and skip the checks for
> > all direct shadow pages. Direct shadow pages are never marked unsynced
> > or have a non-zero write-flooding count.
>
> Nit: IMHO it's better to spell out the exact functional change, IIUC those
> are the direct mapped SPs where guest uses huge pages but host uses only
> small pages for the shadowing?

Yes that's correct. I'll include that in the commit message in the next version.

>
> >
> > Checking sp->role.direct alos generates better code than checking
> > direct_map because, due to register pressure, direct_map has to get
> > shoved onto the stack and then pulled back off.
> >
> > No functional change intended.
> >
> > Reviewed-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: David Matlack <dmatlack@google.com>
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
> --
> Peter Xu
>

