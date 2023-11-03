From: Sean Christopherson <seanjc@google.com>
Date: Fri, 3 Nov 2023 16:17:23 -0700
Subject: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <CA+EHjTzGzXnfXHh0m5iHt9m3BxerkUS56EVPDA_az6n2FRnk3w@mail.gmail.com>
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <CA+EHjTzj4drYKONVOLP19DYpJ4O8kSXcFzw2AKier1QdcFKx_Q@mail.gmail.com>
 <ZUF8A5KpwpA6IKUH@google.com> <CA+EHjTwTT9cFzYTtwT43nLJS01Sgt0NqzUgKAnfo2fiV3tEvXg@mail.gmail.com>
 <ZULJYg5cf1UrNq3e@google.com> <CA+EHjTzGzXnfXHh0m5iHt9m3BxerkUS56EVPDA_az6n2FRnk3w@mail.gmail.com>
Message-ID: <ZUV_g1_3pj62OgF-@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 02, 2023, Fuad Tabba wrote:
> On Wed, Nov 1, 2023 at 9:55?PM Sean Christopherson <seanjc@google.com> wrote:
> > E.g. a misbehaving userspace could prematurely delete a memslot.  And the more
> > fun example is intrahost migration, where the plan is to allow pointing multiple
> > guest_memfd files at a single guest_memfd inode:
> > https://lore.kernel.org/all/cover.1691446946.git.ackerleytng at google.com
> >
> > There was a lot of discussion for this, but it's scattered all over the place.
> > The TL;DR is is that the inode will represent physical memory, and a file will
> > represent a given "struct kvm" instance's view of that memory.  And so the memory
> > isn't reclaimed until the inode is truncated/punched.
> >
> > I _think_ this reflects the most recent plan from the guest_memfd side:
> > https://lore.kernel.org/all/1233d749211c08d51f9ca5d427938d47f008af1f.1689893403.git.isaku.yamahata at intel.com

Doh, sitting in my TODO folder...

https://lore.kernel.org/all/20231016115028.996656-1-michael.roth at amd.com

> Thanks for pointing that out. I think this might be the way to go.
> I'll have a closer look at this and see how to get it to work with
> pKVM.

