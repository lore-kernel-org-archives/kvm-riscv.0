Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FBBC982FA
	for <kvm-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 08:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wIVCZOGQwJtTa5TeiRGBSmivApFrqkVNSzclS8qn1E=; b=iwGu7q/Mt6U/O3
	m83dW84H3WpqT7YMAfB9uTzs5fKbp//vTAaDnC1mKwAGy8O4VDS1g5tQ2trpIXZWnK09sLvfHs/6N
	+CEgrLTEY+9rx2Kw2u9UeF+anMJA5nOtXp/mOiytPb95u6aNw110Z7sHAuxNhjgTGtwI1WFIXWG33
	xICW/t1SuW6mIqmXjIc3cdVyej++2KVpCG3EfkZ2wjkSnSTPoTkrfgduPjleywjjKHBFHD7k7l5Yc
	I35qZ12bQwvdUuFVdF18bkzQh4SmIBuwwYospjYGQe/Ilx91JKTjatbaVlawidNC5oZS987qnUinY
	iBQWEcUep7e2SEWAwvVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9I7K-00000007UPm-2uT9;
	Wed, 23 Sep 2026 08:14:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9I7J-00000007UOy-3Y8h;
	Wed, 23 Sep 2026 08:14:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F2520600AA;
	Wed, 23 Sep 2026 08:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376301F000FF;
	Wed, 23 Sep 2026 08:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790151252;
	bh=4asDkf1r4nhSOrT7R8hAyZcEQKKYrXhZ/zPFbXlZHas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mCJlfOwtX67y203buKELQIT2TJkfDrkJVRWjviTUThii3FIl01hNmt/2/N5niDJsO
	 pMfVhn9hKYcyv1hPNTj3q8nO0Pds6VFO+rGQe1AtibuYmlGhfEvG5fzsVNd5VZj00d
	 fkgcgDIaUfRNs16fD4U8B+bk8I0EVqFfud76K+T15hPjY5Wnzx7h17G1IEpBvKdbdT
	 fwOMBpLGIgd0Nxsna3HHhcpWKXrmzcnrf1IYhuJaw4NDIion+IMG6MmbJbYDpOjNxG
	 ds54K/vBGhy978o0s9QlAtQmkuOq1eOy+SdadnN3yilV4MeGzEJApyN21XCzbDlSMz
	 y5uiJtnDQNScw==
Date: Wed, 23 Sep 2026 09:13:40 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 00/40] mm: make VMA flag semantics explicit, eliminate
 VM_SPECIAL
Message-ID: <arOCPN02xB7mykju@gremlin>
References: <20260914-b4-mmap-prepare-vma-flag-sanify-v2-0-7d9781ed5361@kernel.org>
 <20260914180811.057cba8fcc48d6e0b53a2683@linux-foundation.org>
 <0b064fe6-ddb3-4f26-a1f2-2e9dd88d590f@kernel.org>
 <CAJuCfpFBichJH4OcmSHTb1rOuQBT6k5pXeua9_KgpWjDBKvsYw@mail.gmail.com>
 <aq6kzpK7wPl3iFGe@gremlin>
 <aq6lW9FvL69QeA9H@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aq6lW9FvL69QeA9H@gremlin>
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

T24gU2F0LCBTZXAgMTksIDIwMjYgYXQgMDQ6MDk6MTNQTSArMDEwMCwgTG9yZW56byBTdG9ha2Vz
IChBUk0pIHdyb3RlOgo+IE9uIFNhdCwgU2VwIDE5LCAyMDI2IGF0IDA0OjA1OjU3UE0gKzAxMDAs
IExvcmVuem8gU3RvYWtlcyAoQVJNKSB3cm90ZToKPiA+IE9uIEZyaSwgU2VwIDE4LCAyMDI2IGF0
IDAxOjMxOjI0UE0gLTA3MDAsIFN1cmVuIEJhZ2hkYXNhcnlhbiB3cm90ZToKPiA+ID4gT24gRnJp
LCBTZXAgMTgsIDIwMjYgYXQgMToyMeKAr1BNIERhdmlkIEhpbGRlbmJyYW5kIChBcm0pCj4gPiA+
IDxkYXZpZEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIDkvMTUvMjYgMDM6
MDgsIEFuZHJldyBNb3J0b24gd3JvdGU6Cj4gPiA+ID4gPiBPbiBNb24sIDE0IFNlcCAyMDI2IDE1
OjU3OjIwICswMTAwICJMb3JlbnpvIFN0b2FrZXMgKEFSTSkiIDxsanNAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4+IFRoZSBWTV9TUEVDSUFMIC8gVk1BX1NQRUNJQUxfRkxB
R1MgbWFzayBjb25mbGF0ZXMgc2V2ZXJhbCB1bnJlbGF0ZWQKPiA+ID4gPiA+PiBwcm9wZXJ0aWVz
Ogo+ID4gPiA+ID4+Cj4gPiA+ID4gPj4gLi4uCj4gPiA+ID4gPj4KPiA+ID4gPiA+PiBJdCdzIGFs
bCByYXRoZXIgYSBtZXNzLgo+ID4gPiA+ID4+Cj4gPiA+ID4gPj4gVGhpcyBzZXJpZXMgYnJpbmdz
IHNvbWUgb3JkZXIgdG8gdGhpbmdzIGJ5IGJvdGggbGltaXRpbmcgd2hhdCBkcml2ZXJzIGNhbgo+
ID4gPiA+ID4+IGRvIHdpdGggVk1BIGZsYWdzIGFuZCBzd2l0Y2hpbmcgdG8gdXNpbmcgcHJlZGlj
YXRlcyB0aGF0IGRlc2NyaWJlCj4gPiA+ID4gPj4gYmVoYXZpb3VyLCBub3QgYXJiaXRyYXJ5IGZs
YWdzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoYXQncyBhIGxvdCBvZiBwYXRjaGVzLgo+ID4gPiA+
ID4KPiA+ID4gPiA+IFJldmlldyBpcyB0aGluIGFuZCBJIGV4cGVjdCB0aGlzIHdvbid0IGltcHJv
dmUgYSBsb3QuICBMb3RzIG9mICJubwo+ID4gPiA+ID4gZnVuY3Rpb25hbCBjaGFuZ2VzIiBjaGFu
Z2VzLgo+ID4gPiA+Cj4gPiA+ID4gSSdsbCBleHBlY3QgdG8gZ28gdGhyb3VnaCBhbGwgb2YgdGhl
bS4gTWlnaHQganVzdCB0YWtlIGEgYml0IDspCj4gPiA+Cj4gPiA+IGRpdHRvCj4gPgo+ID4gVGhh
bmtzIGd1eXMhCj4KPiBOb3RlIHYzIGhhcyBiZWVuIHBvc3RlZCB0byBmaXggYSBzdHVwaWQgYnVn
IGluIDEvNDAgKyBhdHRhY2sgc29tZSB2ZXJ5IHRyaXZpYWwKPiBzYXNoaWtvIHN0dWZmCj4KPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS8yMDI2MDkxNy1iNC1tbWFwLXByZXBhcmUt
dm1hLWZsYWctc2FuaWZ5LXYzLTAtNDU4M2Q4YTIzYmNhQGtlcm5lbC5vcmcvCgpKdXN0IGEgZ2Vu
dGxlIG51ZGdlIG9uIHRoaXMgOikKCklmIHlvdSBndXlzIG9yIGFueWJvZHkgZWxzZSBoYXMgc29t
ZSB0aW1lIGl0J2QgYmUgYXBwcmVjaWF0ZWQhIChvYnYuIHRoZSB2MyBhcwpsaW5rZWQgYWJvdmUg
bm90IHRoaXMgdjIhKQoKSSBrbm93IHRoZSBzZXJpZXMgc2VlbXMgaW50aW1pZGF0aW5nIGJ1dCBt
b3N0IG9mIHRoZSBjb21taXRzIGFyZSB2ZXJ5IHNtYWxsIGFuZAppdCdzIGJlZW4gaW4gLW5leHQg
Zm9yIGEgd2hpbGUuCgo+Cj4gPgo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gLS0KPiA+ID4gPiBDaGVl
cnMsCj4gPiA+ID4KPiA+ID4gPiBEYXZpZAo+ID4KPiA+IC0tCj4gPiBDaGVlcnMsIExvcmVuem8K
Pgo+IC0tCj4gQ2hlZXJzLCBMb3JlbnpvCgotLQpDaGVlcnMsIExvcmVuem8KCi0tIAprdm0tcmlz
Y3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
