Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C10C88E4C
	for <kvm-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 10:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HOC5oc7fSPoL/PsEE8iRiF72cb5HlDh5Gs4aiUY+bv4=; b=LwhU8vOQ7Tyoo1
	5em45yEpQS0Y1egte+DrwFRg9ApFv2PL5Z8WMKhGLDV4H36F2ScrU9kaOWoayuyPIwgfLrzzmN3T1
	MqGyyBlcAR6rMG28ZYgmom36ENTd0rtYF16bveUbdxXn2gdk4RFrZ35Zm3xt+Syy7XVCz8tm4cUzR
	OxmEDNSOtFeGqSabF5FAcLT6NR0Jy/xx0OE12uFf9wdOzH70mJT2UBWYEi25/Rr1t7H5HK4tUKquH
	hOUxs2w5Qbq7Sfe9W8CN/xuQ/4Ea+oN4Yp/VWb7C/9ULXFXQWIm1dSPvbFpY6rslsX7Q+arcfySoL
	9Pig5sXTLtwvnCB3iFMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yGS-0000000GLIz-1FVD;
	Fri, 11 Sep 2026 10:13:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yGQ-0000000GLIe-3tbC;
	Fri, 11 Sep 2026 10:13:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E893432D5;
	Fri, 11 Sep 2026 10:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F4F1F000FF;
	Fri, 11 Sep 2026 10:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789121626;
	bh=AJ4osXGfnva+GsW9Xj6wSlPvmOYx8+Z4McGwoEWWU6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VXiIsYXGW7V+CUC2hoUUxshBtk//170ahXby5qOmnHCTEG6nprU1IS50u25G/fRQk
	 sf9ytH2Ce2iGqonEAUfAmBNxEiX0H5gDZvz851NX8EhIuDaWSIQBlPZWYHnVma0aGj
	 blDmI4LY1KM28dzcRxXSp3rNd+ml+k1Jf5jXcr5BNdmFsP+f0lE+KyInKD5utrTv18
	 j0kWa0ZAaMlc3Pw4wRDO2h4SoWYRal6ZvW3YmHkVxX6gQf6/JqWhQp1QSVXE2Kca+2
	 BYYLTVktrg9Xqy9CLQ0dyOX4enXiqnPzEjwUfsC5vJviK7A/gYwNlJA1GGOz2i3bhy
	 SIFHvCnClRnig==
Date: Fri, 11 Sep 2026 11:13:15 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Jann Horn <jannh@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH 11/39] selinux: reject writable opens of policy file,
 drop mmap shared/write check
Message-ID: <aqPS_UHU3MotlchR@gremlin>
References: <20260908-b4-mmap-prepare-vma-flag-sanify-v1-0-dacf19cce22b@kernel.org>
 <20260908-b4-mmap-prepare-vma-flag-sanify-v1-11-dacf19cce22b@kernel.org>
 <CAG48ez3Ucb8HyhjC1-fijFiYJsnWcTLYHvJjzMyU710mgegxnA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG48ez3Ucb8HyhjC1-fijFiYJsnWcTLYHvJjzMyU710mgegxnA@mail.gmail.com>
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBTZXAgMDgsIDIwMjYgYXQgMTA6MjI6MjBQTSArMDIwMCwgSmFubiBIb3JuIHdyb3Rl
Ogo+IE9uIFR1ZSwgU2VwIDgsIDIwMjYgYXQgMTA6MDfigK9QTSBMb3JlbnpvIFN0b2FrZXMgKEFS
TSkgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+IFRoZSBwb2xpY3kgZmlsZSBoYXMgbm8gd3Jp
dGUgbWV0aG9kIGFuZCBpcyBleHBvc2VkIHJlYWQtb25seSAoU19JUlVHTyBpbgo+ID4gc2VsaW51
eF9maWxlc1tdKSwgeWV0IHNlbF9vcGVuX3BvbGljeSgpIHBlcmZvcm1zIG5vIG9wZW4gbW9kZSBj
aGVjaywgc28gYQo+ID4gQ0FQX0RBQ19PVkVSUklERSBjYWxsZXIgY2FuIG9wZW4gaXQgT19SRFdS
LiBSZWplY3QgRk1PREVfV1JJVEUgYXQgb3BlbiwgYXMKPiA+IGtlcm5mcyBkb2VzLgo+ID4KPiA+
IFRoZSBmaWxlIGNhbiB0aGVuIG5ldmVyIGJlIG1hcHBlZCB3aXRoIEZNT0RFX1dSSVRFLCBzbyBk
b19tbWFwKCkgYWx3YXlzCj4gPiBjbGVhcnMgVk1fTUFZV1JJVEUgYW5kIFZNX1NIQVJFRCBmb3Ig
TUFQX1NIQVJFRCBtYXBwaW5ncyBhbmQgdGhlIFZNX1NIQVJFRAo+ID4gY2hlY2sgaW4gc2VsX21t
YXBfcG9saWN5KCkgY2Fubm90IGJlIHJlYWNoZWQuIFJlbW92ZSBpdC4KPgo+IFlvdSBzaG91bGQg
YWxzbyBiZSBhYmxlIHRvIHJlbW92ZSB0aGUgc2VsX21tYXBfcG9saWN5X29wcy5wYWdlX21rd3Jp
dGUKPiBoYW5kbGVyLCB3aGljaCBpcyBvbmx5IGZvciBzaGFyZWQtd3JpdGFibGUgZmF1bHRzLCBy
aWdodD8KClllYWggSSB0aGluayB5b3UncmUgcmlnaHQsIHRob3VnaCBJIHdvbmRlciBpZiBpdCdz
IGEgYml0IG91dCBvZiBzY29wZSBmb3IgdGhpcwpjaGFuZ2UgYXMgaXQncyBmb2N1c2VkIG9uIHJl
bW92aW5nIGEgVk1BX01BWVdSSVRFX0JJVCBjbGVhcmFuY2UgZm9yIGEKbm9uLWtlcm5lbC1vd25l
ZCBWTUEuCgpTbyBtYXliZSBvbmUgZm9yIGEgZm9sbG93IHVwPwoKPgo+ID4gVGhpcyBhbHNvIHN0
b3BzIHNlbF9tbWFwX3BvbGljeSgpIGNsZWFyaW5nIFZNX01BWVdSSVRFIG9uIGEgbWFwcGluZyB0
aGF0IGlzCj4gPiBuZWl0aGVyIGEgUEZOIG1hcCBub3IgYSBtaXhlZCBtYXAsIGFoZWFkIG9mIHRo
ZSBjb3JlIGVuZm9yY2luZyB0aGF0IG9ubHkKPiA+IHN1Y2ggbWFwcGluZ3MgbWF5IGRvIHNvLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gU3RvYWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5v
cmc+Cj4KPiBSZXZpZXdlZC1ieTogSmFubiBIb3JuIDxqYW5uaEBnb29nbGUuY29tPgoKVGhhbmtz
IQoKLS0KQ2hlZXJzLCBMb3JlbnpvCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2t2bS1yaXNjdgo=
