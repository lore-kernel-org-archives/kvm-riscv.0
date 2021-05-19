From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 19 May 2021 13:18:44 +0200
Subject: [PATCH v18 00/18] KVM RISC-V Support
In-Reply-To: <YKTsyyVYsHVMQC+G@kroah.com>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <YKSa48cejI1Lax+/@kroah.com>
 <CAAhSdy18qySXbUdrEsUe-KtbtuEoYrys0TcmsV2UkEA2=7UQzw@mail.gmail.com>
 <YKSgcn5gxE/4u2bT@kroah.com> <YKTsyyVYsHVMQC+G@kroah.com>
Message-ID: <d7d5ad76-aec3-3297-0fac-a9da9b0c3663@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 19/05/21 12:47, Greg Kroah-Hartman wrote:
>> It is not a dumping ground for stuff that arch maintainers can not seem
>> to agree on, and it is not a place where you can just randomly play
>> around with user/kernel apis with no consequences.
>>
>> So no, sorry, not going to take this code at all.
>
> And to be a bit more clear about this, having other subsystem
> maintainers drop their unwanted code on this subsystem,_without_  even
> asking me first is just not very nice. All of a sudden I am now > responsible for this stuff, without me even being asked about it.
> Should I start throwing random drivers into the kvm subsystem for them
> to maintain because I don't want to?:)

(I did see the smiley), I'm on board with throwing random drivers in 
arch/riscv. :)

The situation here didn't seem very far from what process/2.Process.rst 
says about staging:

- "a way to keep track of drivers that aren't up to standards", though 
in this case the issue is not coding standards or quality---the code is 
very good---and which people "may want to use"

- the code could be removed if there's no progress on either changing 
the RISC-V acceptance policy or ratifying the spec

Of course there should have been a TODO file explaining the situation. 
But if you think this is not the right place, I totally understand; if 
my opinion had any weight in this, I would just place it in arch/riscv/kvm.

The RISC-V acceptance policy as is just doesn't work, and the fact that 
people are trying to work around it is proving it.  There are many ways 
to improve it:

- get rid of it;

- provide a path to get an exception;

- provide a staging place sot hat people to do their job of contributing 
code to Linux (e.g. arch/riscv/staging/kvm).

If everything else fail, I guess we can place it in 
drivers/virt/riscv/kvm, even though that's just as silly a workaround. 
It's a pity because the RISC-V virtualization architecture has a very 
nice design, and the KVM code is also a very good example of how to do 
things right.

Paolo

> If there's really no other way to do this, than to put it in staging,
> let's talk about it.  But saying "this must go here" is not a
> conversation...


