From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 3 Nov 2022 16:27:47 +0100
Subject: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
In-Reply-To: <b37267a9-c0b4-9841-71af-d8eab9baeb60@linux.ibm.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <b37267a9-c0b4-9841-71af-d8eab9baeb60@linux.ibm.com>
Message-ID: <82df23f2-b049-8bee-8bb8-608645b918d8@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/3/22 13:08, Christian Borntraeger wrote:
>> There are bug fixes throughout this series.? They are more scattered than
>> I would usually prefer, but getting the sequencing correct was a gigantic
>> pain for many of the x86 fixes due to needing to fix common code in order
>> for the x86 fix to have any meaning.? And while the bugs are often fatal,
>> they aren't all that interesting for most users as they either require a
>> malicious admin or broken hardware, i.e. aren't likely to be encountered
>> by the vast majority of KVM users.? So unless someone _really_ wants a
>> particular fix isolated for backporting, I'm not planning on shuffling
>> patches.
>>
>> Tested on x86.? Lightly tested on arm64.? Compile tested only on all 
>> other architectures.
> 
> Some sniff tests seem to work ok on s390.

Thanks.  There are just a couple nits, and MIPS/PPC/RISC-V have very 
small changes.  Feel free to send me a pull request once Marc acks.

Paolo


