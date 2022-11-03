From: Christian Borntraeger <borntraeger@linux.ibm.com>
Date: Thu, 3 Nov 2022 13:08:02 +0100
Subject: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
Message-ID: <b37267a9-c0b4-9841-71af-d8eab9baeb60@linux.ibm.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am 03.11.22 um 00:18 schrieb Sean Christopherson:
> Non-x86 folks, please test on hardware when possible.  I made a _lot_ of
> mistakes when moving code around.  Thankfully, x86 was the trickiest code
> to deal with, and I'm fairly confident that I found all the bugs I
> introduced via testing.  But the number of mistakes I made and found on
> x86 makes me more than a bit worried that I screwed something up in other
> arch code.
> 
> This is a continuation of Chao's series to do x86 CPU compatibility checks
> during virtualization hardware enabling[1], and of Isaku's series to try
> and clean up the hardware enabling paths so that x86 (Intel specifically)
> can temporarily enable hardware during module initialization without
> causing undue pain for other architectures[2].  It also includes one patch
> from another mini-series from Isaku that provides the less controversial
> patches[3].
> 
> The main theme of this series is to kill off kvm_arch_init(),
> kvm_arch_hardware_(un)setup(), and kvm_arch_check_processor_compat(), which
> all originated in x86 code from way back when, and needlessly complicate
> both common KVM code and architecture code.  E.g. many architectures don't
> mark functions/data as __init/__ro_after_init purely because kvm_init()
> isn't marked __init to support x86's separate vendor modules.
> 
> The idea/hope is that with those hooks gone (moved to arch code), it will
> be easier for x86 (and other architectures) to modify their module init
> sequences as needed without having to fight common KVM code.  E.g. I'm
> hoping that ARM can build on this to simplify its hardware enabling logic,
> especially the pKVM side of things.
> 
> There are bug fixes throughout this series.  They are more scattered than
> I would usually prefer, but getting the sequencing correct was a gigantic
> pain for many of the x86 fixes due to needing to fix common code in order
> for the x86 fix to have any meaning.  And while the bugs are often fatal,
> they aren't all that interesting for most users as they either require a
> malicious admin or broken hardware, i.e. aren't likely to be encountered
> by the vast majority of KVM users.  So unless someone _really_ wants a
> particular fix isolated for backporting, I'm not planning on shuffling
> patches.
> 
> Tested on x86.  Lightly tested on arm64.  Compile tested only on all other
> architectures.

Some sniff tests seem to work ok on s390.


