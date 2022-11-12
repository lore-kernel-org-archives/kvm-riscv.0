From: Conor.Dooley@microchip.com <Conor.Dooley@microchip.com>
Date: Sat, 12 Nov 2022 21:40:28 +0000
Subject: [PATCH v2 0/5] riscv: add PREEMPT_RT support
In-Reply-To: <ea0188d3-3886-6cb6-6811-82e4ffd992b8@microchip.com>
References: <20220831175920.2806-1-jszhang@kernel.org>
 <4488b1ec-aa34-4be5-3b9b-c65f052f5270@microchip.com>
 <YxIAmT2X9TU1CZhC@xhacker>
 <ea5cdba4-7a79-56b3-f8d7-7785569dedd6@microchip.com>
 <Y25c626x6UPRtscs@linutronix.de>
 <ea0188d3-3886-6cb6-6811-82e4ffd992b8@microchip.com>
Message-ID: <151be14c-3a2c-2721-a7dc-3f2be25bafb5@microchip.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/11/2022 14:34, Conor Dooley - M52691 wrote:
> On 11/11/2022 14:32, Sebastian Andrzej Siewior wrote:
>> On 2022-09-02 13:29:23 [+0000], Conor.Dooley at microchip.com wrote:
>>> I'll give it a run through tonight or tomorrow & give you a full log
>>> of what I saw. There's some splats all over the place for me, but I
>>> can't tell if that's just knock-on from the other issues.
>>
>> Is there an update to this or the series as a whole?
> 
> Not from me.. completely forgot about it.
> I'll put it back in my todo list, sorry.
> 

I tried out v6.0.5-rc5 + this patchset (it doesnt apply to v6.1-rcN)
and rt14, got the following:
[    4.036667] smp: Bringing up secondary CPUs ...
[    4.069365] BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:46
[    4.069389] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/1
[    4.069410] preempt_count: 1, expected: 0
[    4.069422] RCU nest depth: 1, expected: 1
[    4.069434] 3 locks held by swapper/1/0:
[    4.069449]  #0: ffffffd82cda3b58 (&pcp->lock){+.+.}-{2:2}, at: get_page_from_freelist+0x220/0x1094
[    4.069537]  #1: ffffffff8129b178 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire+0x0/0x2e
[    4.069602]  #2: ffffffff813a3e38 (&zone->lock){+.+.}-{2:2}, at: __rmqueue_pcplist+0x156/0xc28
[    4.069662] irq event stamp: 0
[    4.069670] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
[    4.069690] hardirqs last disabled at (0): [<ffffffff8000f0c8>] copy_process+0x50c/0xdaa
[    4.069727] softirqs last  enabled at (0): [<ffffffff8000f0d6>] copy_process+0x51a/0xdaa
[    4.069756] softirqs last disabled at (0): [<0000000000000000>] 0x0
[    4.069776] Preemption disabled at:
[    4.069782] [<ffffffff80041346>] migrate_enable+0x32/0x124
[    4.069819] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.0.5-rt14-00006-g0fda08a972f4-dirty #1
[    4.069848] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
[    4.069861] Call Trace:
[    4.069870] [<ffffffff80006628>] show_stack+0x2c/0x38
[    4.069907] [<ffffffff80900ad4>] dump_stack_lvl+0x64/0x86
[    4.069935] [<ffffffff80900b0a>] dump_stack+0x14/0x1c
[    4.069959] [<ffffffff80047534>] __might_resched+0x1bc/0x1c6
[    4.069995] [<ffffffff80908f7a>] rt_spin_lock+0x42/0xb8
[    4.070033] [<ffffffff801cab7a>] __rmqueue_pcplist+0x156/0xc28
[    4.070061] [<ffffffff801cbade>] get_page_from_freelist+0x24e/0x1094
[    4.070088] [<ffffffff801cb712>] __alloc_pages+0xc6/0x244
[    4.070113] [<ffffffff801ede42>] new_slab+0x8c/0x4a8
[    4.070153] [<ffffffff801e955a>] ___slab_alloc+0x5d4/0x9a4
[    4.070181] [<ffffffff801ea206>] __kmalloc+0xc0/0x1fc
[    4.070209] [<ffffffff80578296>] detect_cache_attributes+0xb4/0x470
[    4.070238] [<ffffffff80590520>] update_siblings_masks+0x2c/0x202
[    4.070270] [<ffffffff80590aa0>] store_cpu_topology+0x30/0x6a
[    4.070296] [<ffffffff80007756>] smp_callin+0x38/0x66
[    4.231582] smp: Brought up 1 node, 4 CPUs

There's other stuff that goes awry later on too:
https://gist.githubusercontent.com/ConchuOD/47fd47dfa1f49eb4b0f2fb2a68852a7c/raw/b109b83eec6caa1d67cbb156c6f3e671c10aefe9/gistfile1.txt

The SDHCI stuff I am seeing without rt & in v6.1-rc4 so is
unrelated, but the rest resembles what I saw previously.
idk anything about -rt so if there's something blatant that
I've missed here, please lmk.
