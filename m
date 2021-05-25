From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 25 May 2021 10:24:03 +0200
Subject: [PATCH v18 00/18] KVM RISC-V Support
In-Reply-To: <YKyxMy+djlscUhr1@kroah.com>
References: <mhng-b093a5aa-ff9d-437f-a10b-47558f182639@palmerdabbelt-glaptop>
 <DM6PR04MB708173B754E145BC843C4123E7269@DM6PR04MB7081.namprd04.prod.outlook.com>
 <YKypJ5SJg2sDtn7/@kroah.com>
 <DM6PR04MB7081843419AFCECABA75AD74E7259@DM6PR04MB7081.namprd04.prod.outlook.com>
 <YKyxMy+djlscUhr1@kroah.com>
Message-ID: <fb03a89a-873d-ab85-8b05-f5f283f54489@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 25/05/21 10:11, Greg KH wrote:
>> 1) facilitate the development work overall, both for Paolo and Anup on the KVM
>> part, but also others to check that their changes do not break KVM support.
> 
> Who are the "others" here?  You can't force your code into the tree just
> to keep it up to date with internal apis that others are changing, if
> you have no real users for it yet.  That's asking others to do your work
> for you:(

I don't know about changes that would break KVM support.  However, 
"other KVM developers" would be able to check that their changes do not 
break the RISC-V implementation, and I would certainly either enforce 
that or do the work myself.

Also, excluding simulators and emulators from the set of "real users" 
ignores the needs of userspace developers, as well as other uses such as 
education/academia.  Linux for x86 (both KVM and bare metal) supports 
features that are only available in emulators and simulators which are 
not even free software.  I am pretty sure that there would be more users 
of KVM/RISC-V than with KVM/MIPS, despite the latter having support in 
real hardware.

Paolo


