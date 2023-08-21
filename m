From: Ackerley Tng <ackerleytng@google.com>
Date: Mon, 21 Aug 2023 19:49:05 +0000
Subject: [RFC PATCH v11 28/29] KVM: selftests: Add basic selftest for guest_memfd()
In-Reply-To: <ZN/4RjDsBLf0FB98@google.com> (message from Sean Christopherson
 on Fri, 18 Aug 2023 16:01:26 -0700)
Message-ID: <diqzwmxotbv2.fsf@ackerleytng-ctop.c.googlers.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:

> On Mon, Aug 07, 2023, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>> 
>> > Add a selftest to verify the basic functionality of guest_memfd():
>> >
>> > <snip>
>> 
>> Here's one more test:
>
> First off, thank you!  I greatly appreciate all the selftests work you (and
> others!) have been doing.
>
> For v2, can you please post a standalone patch?  My workflow barfs on unrelated,
> inlined patches.  I'm guessing I can get b4 to play nice, but it's easier to just
> yell at people :-)
>

Here's a standalone patch :)
https://lore.kernel.org/lkml/20230821194411.2165757-1-ackerleytng at google.com/

> <snip>

