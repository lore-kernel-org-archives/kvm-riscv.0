Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8632BC9830B
	for <kvm-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJS523QSbVGiOj3AZ/59r3DjDJfGTyqR/GwKTK4mqz0=; b=u9wQpiE2haE/p3
	JAfHgLqHQFB4fQuk3wbAd68WX/pmBzrqMi3EGQA2Vo1CNUMcYz5OVJzyYedCMXJa4oaBdfcGGpQLO
	yeuJ2Mt5iLZ4gfcwefRWPR+t9h8+1eVtHA7S04+CoA/ORGePEvs58xf+8sEUKPq5BZef2+6Y6solF
	qK3gBNpauP8mav7VTwnCdgviP31uPsQj9n+yikcdgploabBYHsKritPFo0pr/PX9c+gYdHyG0T7xj
	WCtj817Kg1Rgan0XEc0UHFqZ/j0jSl2XjSm1B7sCtIpdQJ6z4jQhZXzEpHhI2zurp6mLBm8TB11kp
	ufXzjmr9iS+szZHhr24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QRa-00000008yF0-3YNI;
	Wed, 23 Sep 2026 17:07:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QRZ-00000008yEg-1PSG;
	Wed, 23 Sep 2026 17:07:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB0AE40227;
	Wed, 23 Sep 2026 17:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370A61F000FF;
	Wed, 23 Sep 2026 17:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790183260;
	bh=DPNB6bW0x8y7Uu11BgHcG7CSR1tZ//UGOmZllbw9Ljw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i12XGUT+ELGTRJSrycRVzqTit3D2pyM9ZR0ZSTlIa0mojim7gB9yUZwmIu+wgWYZK
	 Ybyv+CV/Yh7wSmglW9QNbCpnx18TWoVPczcRHqo0Q/mnJsqjZQ3eFn2cP25qIt7fM9
	 +POE/rp3vRI+Oxpo8QK9N4EfOTJ5jI0dLtJ432mM7IKfaNA3MKzBEomsWln5bFOqPN
	 PxFbALYbyklQCFhfUINibcEvNCNrhcGgRwqd9F7gXGPywV48eYeWHkrJqezKwBbst0
	 GSXVIWXaPeEYe4X28qZjKKxCsy9Q0ESN1tzaw+iT6CqBpO8zm4Si1SUtWVa2wxKSZ8
	 vegFjunsRBTBA==
Date: Wed, 23 Sep 2026 18:07:07 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 02/40] mm/vma: predicate setting mmap_prepare VMA
 fields on new vma alloc
Message-ID: <arQCCzmMARX81-3y@gremlin>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-2-4583d8a23bca@kernel.org>
 <CAJuCfpEa8tUmYJBjx-cRdAE8y-jcKY0C81kAOa1QZS7F6tKdfQ@mail.gmail.com>
 <arP0oJgrgZlgtrb6@gremlin>
 <CAJuCfpFPPGaK-grNx9qiQOhzAXbxU+SO+95Fht1571TGREx2oQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpFPPGaK-grNx9qiQOhzAXbxU+SO+95Fht1571TGREx2oQ@mail.gmail.com>
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

T24gV2VkLCBTZXAgMjMsIDIwMjYgYXQgMDk6MDk6MzhBTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2Fy
eWFuIHdyb3RlOgo+IE9uIFdlZCwgU2VwIDIzLCAyMDI2IGF0IDg6NTTigK9BTSBMb3JlbnpvIFN0
b2FrZXMgKEFSTSkgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIFNlcCAy
MywgMjAyNiBhdCAwODozMjo0M0FNIC0wNzAwLCBTdXJlbiBCYWdoZGFzYXJ5YW4gd3JvdGU6Cj4g
PiA+IE9uIFRodSwgU2VwIDE3LCAyMDI2IGF0IDk6MjTigK9BTSBMb3JlbnpvIFN0b2FrZXMgKEFS
TSkgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEl0IG9ubHkgbWFrZXMg
c2Vuc2UgdG8gbWFuaXB1bGF0ZSBWTUEgZmllbGRzIGlmIHdlIGFsbG9jYXRlZCBhIG5ldyBWTUEs
Cj4gPiA+ID4gcmF0aGVyIHRoYW4gbWVyZ2VkIGl0Lgo+ID4gPiA+Cj4gPiA+ID4gVk1BIG1lcmdp
bmcgZG9lcyBub3QgY29tcGFyZSB2bV9vcHMgb3Igdm1fcHJpdmF0ZV9kYXRhLCBzbyBhIG1lcmdl
ZCBWTUEKPiA+ID4gPiBrZWVwcyBpdHMgb3duLCB3aGljaCBpcyBhbHNvIHdoYXQgdGhlIGxlZ2Fj
eSBmX29wLT5tbWFwIHBhdGggZG9lcyBzaW5jZSBpdAo+ID4gPiA+IG5ldmVyIHRvdWNoZXMgYW4g
ZXhpc3RpbmcgVk1BLiBQcmV2aW91c2x5IHNldF92bWFfdXNlcl9kZWZpbmVkX2ZpZWxkcygpCj4g
PiA+ID4gb3Zlcndyb3RlIHRoZSBtZXJnZWQgVk1BJ3MgZmllbGRzIHdpdGggdGhvc2Ugc2V0IGZv
ciB0aGUgbmV3IG1hcHBpbmcuIEluCj4gPiA+ID4gcHJhY3RpY2UgdGhlc2UgYXJlIHRoZSBzYW1l
IHZhbHVlcywgd2l0aCByYXJlIGV4Y2VwdGlvbnMgc3VjaCBhcyBzaG1lbQo+ID4gPiA+IHNlbGVj
dGluZyB2bV9vcHMgYmFzZWQgb24gd2hldGhlciB0aGUgZmlsZSBoYXMgYmVlbiB1bmxpbmtlZCwg
c28gbm8KPiA+ID4gPiB1c2VyLXZpc2libGUgY2hhbmdlIGlzIGV4cGVjdGVkLgo+ID4gPiA+Cj4g
PiA+ID4gTWFrZSB0aGlzIGRlcGVuZGVuY3kgZXhwbGljaXQsIGFuZCBhZGRpdGlvbmFsbHkgY29u
c3RpZnkgaGF2ZV9tbWFwX3ByZXBhcmUKPiA+ID4gPiB3aGlsZSB3ZSdyZSBoZXJlLgo+ID4gPgo+
ID4gPiBUaGUgZmFjdCB0aGF0IHdlIG1pZ2h0IGJlIG92ZXJyaWRpbmcgYXR0cmlidXRlcyBvZiBh
biBleGlzdGluZyBWTUEKPiA+ID4gdGhhdCB3ZSBtZXJnZWQgd2l0aCBpcyB0ZWNobmljYWxseSBh
IGJ1ZyBldmVuIGlmIHdlIG5ldmVyIGhpdCBpdCwKPiA+ID4gcmlnaHQ/IElmIHNvLCBzaG91bGQg
d2UgaGF2ZToKPiA+ID4KPiA+ID4gRml4ZXM6IGM4NGJmNmRkMmI4MyAoIm1tOiBpbnRyb2R1Y2Ug
bmV3IC5tbWFwX3ByZXBhcmUoKSBmaWxlIGNhbGxiYWNrIikKPiA+Cj4gPiBJdCdzIG5vdCBhIGJ1
ZywgaXQgaXMgYW4gaW4tYnVpbHQgYXNzdW1wdGlvbiB0aGF0IHRoZSBzdGF0ZSB1c2VkIHRvIGFz
c2Vzcwo+ID4gbWVyZ2VhYmlsaXR5IGltcGxpZXMgdGhlIHNhbWUgcHJvcGVydGllcy4KPgo+IEht
bS4gV2hhdCBwcmV2ZW50cyB0d28gVk1BcyB3aXRoIGRpZmZlcmVudCB2bV9wcml2YXRlX2RhdGEg
bWVtYmVycyB0bwo+IGJlIG1lcmdlZD8gSUlVQyBpc19tZXJnZWFibGVfdm1hKCkgZG9lcyBub3Qg
Y2hlY2sgdm1fcHJpdmF0ZV9kYXRhLiBJbgo+IHN1Y2ggYSBjYXNlIHNldF92bWFfdXNlcl9kZWZp
bmVkX2ZpZWxkcygpIHdvdWxkIG92ZXJyaWRlCj4gdm1fcHJpdmF0ZV9kYXRhIG9mIGFuIGV4aXN0
aW5nIFZNQSwgbm8/CgpJIHRoaW5rIHlvdSdyZSByaWdodCB0aGF0IGl0IHNob3VsZCBiZSBhIGZp
eCBwYXRjaCwgSSdsbCBwdXQgaXQgb3V0IG9mIHRoZQpzZXJpZXMgYW5kIHNlbmQgaXQgYXMgb25l
LgoKVGhlIGlzc3VlIGhlcmUgaXMgbW9yZSBzbyB2bV9wcml2YXRlX2RhdGEgdGhhbiB2bV9vcHMu
IEFuZCByZWFsbHkgaXQncyB0aGF0CnZtX29wcy0+bWFwcGVkKCkgd2Fzbid0IGNhbGxlZCBzbyB5
b3UgY291bGQgaGF2ZSBhIHJlZmNvdW50IGdvIHRvIHplcm8gYW5kCnN0YXkgYXQgemVybyB3aGVu
IGl0IHNob3VsZG4ndCBoYXZlIGJlZW4sIGZvciBpbnN0YW5jZS4KCkJ1dCBpbiBnZW5lcmFsIHRo
b3VnaCBpZiB5b3UgcmVtb3ZlIG1tYXBfcHJlcGFyZSBhbmQgYXNrIHRoZSBzYW1lIHF1ZXN0aW9u
OgoKV2hhdCBwcmV2ZW50cyBhIG1lcmdlIG9mIDIgZXhpc3RpbmcgVk1BcyB0aGF0IHdlcmUgbWFw
cGVkIHVzaW5nIHRoZQp0cmFkaXRpb25hbCBtbWFwIGhvb2sgd2hpY2ggc29tZWhvdyBoYXZlIGVu
dGlyZWx5IGRpc3RpbmN0IHZtX3ByaXZhdGVfZGF0YQphbmQgdm1fb3BzIGJ1dCB0aGUgc2FtZSBm
aWxlPwoKVGhlIGFuc3dlciBpcyBub3RoaW5nIHByZXZlbnRzIHRoYXQsIGJ1dCB0aGVyZSdzIGFu
IHVuZGVybHlpbmcgYXNzdW1wdGlvbgp0aGF0IHRoaXMgc3RhdGUgaXMgZnVuZ2libGUgZm9yIGEg
Vk1BIG92ZXIgYSBnaXZlbiByYW5nZSBnaXZlbiB0aGUgc2FtZQpmaWxlLgoKSW4gdGhhdCBjYXNl
LCBmb3IgYW55dGhpbmcgd2hlcmUgYW4gYWxsb2NhdGlvbiBvciBlLmcuIHJlZmNvdW50IGNoYW5n
ZQpvY2N1cnJlZCwgdGhlbiB2bV9vcHMtPmNsb3NlKCkgd2lsbCBoYW5kbGUgdGhlIGRlY3JlbWVu
dCwgYW5kIHRoZSBvcmlnaW5hbApWTUEncyBzdGF0ZSBzaG91bGQgc3VmZmljZS4KCkJ1dCBoZXJl
IGl0J3MgYSBwcm9ibGVtIGJlY2F1c2UgeW91IG92ZXJ3cml0ZSBpdCArIGRvbid0IGNhbGwKdm1f
b3BzLT5tYXBwZWQoKS4uLgoKPgo+ID4KPiA+IEFuZCBpZiBpdCB3YXMsIGl0J2QgbmVlZCBmaXhp
bmcgYSBkaWZmZXJlbnQgd2F5IChjaGVjayB0aGUgZmllbGQgZm9yIGluc3RhbmNlKQo+ID4gYW5k
IHdvdWxkIGFwcGx5IHRvIHRoZSBsZWdhY3kgbW1hcCBob29rIGFsc28uCj4gPgo+ID4gVGhpcyBj
aGFuZ2UgaXMgbmVlZGVkIGZvciB0aGUgc2VyaWVzIHRob3VnaC4KPiA+Cj4gPiA+Cj4gPiA+ID4K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMb3JlbnpvIFN0b2FrZXMgKEFSTSkgPGxqc0BrZXJuZWwu
b3JnPgo+ID4gPgo+ID4gPiBSZXZpZXdlZC1ieTogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJA
Z29vZ2xlLmNvbT4KPiA+Cj4gPiBUaGFua3MhCj4gPgo+ID4gPgo+ID4gPiA+IC0tLQo+ID4gPiA+
ICBtbS92bWEuYyB8IDQgKystLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL21tL3ZtYS5j
IGIvbW0vdm1hLmMKPiA+ID4gPiBpbmRleCBmYTc4NGYwNjlkYTQuLjRiNzRiNDhjMjliNyAxMDA2
NDQKPiA+ID4gPiAtLS0gYS9tbS92bWEuYwo+ID4gPiA+ICsrKyBiL21tL3ZtYS5jCj4gPiA+ID4g
QEAgLTI4OTQsNyArMjg5NCw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIF9fbW1hcF9yZWdpb24o
c3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiA+ID4gPiAgewo+ID4gPiA+
ICAgICAgICAgc3RydWN0IG1tX3N0cnVjdCAqbW0gPSBjdXJyZW50LT5tbTsKPiA+ID4gPiAgICAg
ICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hID0gTlVMTDsKPiA+ID4gPiAtICAgICAgIGJv
b2wgaGF2ZV9tbWFwX3ByZXBhcmUgPSBmaWxlICYmIGZpbGUtPmZfb3AtPm1tYXBfcHJlcGFyZTsK
PiA+ID4gPiArICAgICAgIGNvbnN0IGJvb2wgaGF2ZV9tbWFwX3ByZXBhcmUgPSBmaWxlICYmIGZp
bGUtPmZfb3AtPm1tYXBfcHJlcGFyZTsKPiA+ID4gPiAgICAgICAgIFZNQV9JVEVSQVRPUih2bWks
IG1tLCBhZGRyKTsKPiA+ID4gPiAgICAgICAgIGNvbnN0IHBnb2ZmX3QgYW5vbl9wZ29mZiA9IGFk
ZHIgPj4gUEFHRV9TSElGVDsKPiA+ID4gPiAgICAgICAgIE1NQVBfU1RBVEUobWFwLCBtbSwgJnZt
aSwgYWRkciwgbGVuLCBwZ29mZiwgYW5vbl9wZ29mZiwgdm1hX2ZsYWdzLCBmaWxlKTsKPiA+ID4g
PiBAQCAtMjkzNyw3ICsyOTM3LDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgX19tbWFwX3JlZ2lv
bihzdHJ1Y3QgZmlsZSAqZmlsZSwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ID4gPiA+ICAgICAgICAg
ICAgICAgICBhbGxvY2F0ZWRfbmV3ID0gdHJ1ZTsKPiA+ID4gPiAgICAgICAgIH0KPiA+ID4gPgo+
ID4gPiA+IC0gICAgICAgaWYgKGhhdmVfbW1hcF9wcmVwYXJlICYmICFtYXBfaXNfYW5vbigmbWFw
KSkKPiA+ID4gPiArICAgICAgIGlmIChoYXZlX21tYXBfcHJlcGFyZSAmJiBhbGxvY2F0ZWRfbmV3
ICYmICFtYXBfaXNfYW5vbigmbWFwKSkKPiA+ID4gPiAgICAgICAgICAgICAgICAgc2V0X3ZtYV91
c2VyX2RlZmluZWRfZmllbGRzKHZtYSwgJm1hcCk7Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAgIF9f
bW1hcF9jb21wbGV0ZSgmbWFwLCB2bWEpOwo+ID4gPiA+Cj4gPiA+ID4gLS0KPiA+ID4gPiAyLjU1
LjAKPiA+ID4gPgo+ID4KPiA+IC0tCj4gPiBDaGVlcnMsIExvcmVuem8KCi0tCkNoZWVycywgTG9y
ZW56bwoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlz
Y3YK
