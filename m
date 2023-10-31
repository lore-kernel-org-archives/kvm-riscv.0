From: David Matlack <dmatlack@google.com>
Date: Tue, 31 Oct 2023 15:39:42 -0700
Subject: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <ZUFzZf-YmCRYP6qo@google.com>
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <ZUFGRyQEuWj4RJS0@google.com> <ZUFzZf-YmCRYP6qo@google.com>
Message-ID: <CALzav=d9eXZfK=op7A=UftbpuPpUbxqV6CmkqqxxBNuNsUU4nw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 31, 2023 at 2:36?PM Sean Christopherson <seanjc@google.com> wrote:
> On Tue, Oct 31, 2023, David Matlack wrote:
> > On 2023-10-27 11:21 AM, Sean Christopherson wrote:
> > > Introduce an ioctl(), KVM_CREATE_GUEST_MEMFD, to allow creating file-based
> > > memory that is tied to a specific KVM virtual machine and whose primary
> > > purpose is to serve guest memory.
>
> > Maybe can you sketch out how you see this proposal being extensible to
> > using guest_memfd for shared mappings?
>
> For in-place conversions, e.g. pKVM, no additional guest_memfd is needed.  What's
> missing there is the ability to (safely) mmap() guest_memfd, e.g. KVM needs to
> ensure there are no outstanding references when converting back to private.
>
> For TDX/SNP, assuming we don't find a performant and robust way to do in-place
> conversions, a second fd+offset pair would be needed.

Is there a way to support non-in-place conversions within a single guest_memfd?

