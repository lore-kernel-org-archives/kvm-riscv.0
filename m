From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 25 Nov 2024 15:09:26 +0100
Subject: [kvm-unit-tests PATCH v3 4/4] riscv: sbi: Add SSE extension tests
In-Reply-To: <20241125-01fae59d27bb81fff71e794e@orel>
References: <20241125115452.1255745-1-cleger@rivosinc.com>
 <20241125115452.1255745-5-cleger@rivosinc.com>
 <20241125-01fae59d27bb81fff71e794e@orel>
Message-ID: <54ac149d-65ac-4b2a-ad52-70bca87e8862@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 25/11/2024 14:53, Andrew Jones wrote:
> On Mon, Nov 25, 2024 at 12:54:48PM +0100, Cl?ment L?ger wrote:
>> Add SBI SSE extension tests for the following features:
>> - Test attributes errors (invalid values, RO, etc)
>> - Registration errors
>> - Simple events (register, enable, inject)
>> - Events with different priorities
>> - Global events dispatch on different harts
>> - Local events on all harts
> 
> And now also double trap and mask/unmask.

Hi drew,

It does not really tests double trap though, only the double trap SSE
event (similar to the RAS one or whatever SSE local event). I'll update
it with mask/unmask at least.

Cl?ment

> 
> Thanks,
> drew


