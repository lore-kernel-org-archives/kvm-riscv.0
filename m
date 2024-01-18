From: Sean Christopherson <seanjc@google.com>
Date: Thu, 18 Jan 2024 09:40:36 -0800
Subject: [PATCH -fixes v2] RISC-V: KVM: Require HAVE_KVM
In-Reply-To: <CAAhSdy0SxZWdCHQVW0Bki+bHpg4qrHWV0aFzJq8V2xYtwsMWhw@mail.gmail.com>
References: <20240104123727.76987-2-ajones@ventanamicro.com> <CAAhSdy0SxZWdCHQVW0Bki+bHpg4qrHWV0aFzJq8V2xYtwsMWhw@mail.gmail.com>
Message-ID: <ZalilFSHBa_XHolD@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 18, 2024, Anup Patel wrote:
> On Thu, Jan 4, 2024 at 6:07?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > KVM requires EVENTFD, which is selected by HAVE_KVM. Other KVM
> > supporting architectures select HAVE_KVM and then their KVM
> > Kconfigs ensure its there with a depends on HAVE_KVM. Make RISCV
> > consistent with that approach which fixes configs which have KVM
> > but not EVENTFD, as was discovered with a randconfig test.
> >
> > Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Closes: https://lore.kernel.org/all/44907c6b-c5bd-4e4a-a921-e4d3825539d8 at infradead.org/
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Queued this patch for Linux-6.8

That should be unnecessary.  Commit caadf876bb74 ("KVM: introduce CONFIG_KVM_COMMON"),
which is in Paolo's pull request for 6.8, addresses the EVENTFD issue.  And the
rest of Paolo's series[*], which presumably will get queued for 6.9, eliminates
HAVE_KVM entirely.

[*] https://lore.kernel.org/all/20240108124740.114453-6-pbonzini at redhat.com

