Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22E9C88E4D
	for <kvm-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 10:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ktZ+LDvPKecTO3OdSbxZPO9OUt2Ys6KKJR4+BR6sDIg=; b=pF2TS3peNKzeQD
	N5po2nD/r4AjN1KLOVF3xtG5tSCBkX1r2+JtgHVKbtQ8pC8WJVFx/2f+AJxQdB1QQ++lCjbNEeRZW
	CYtH7s/41JLJwkU5CPXZgsl8gqHpXifN/R11vdc7+uuxO5jDZAaygraHm6eWQB6PiVNltEtFqVxGU
	b11TmWKYBaaXFfoutTDCrhalVOq4PtQNQ0JM7CTVFEltERMhE4yzADCtSR1HXZTH1nw0+AMNIm8+l
	vfAXjVla6dX0H4XZkuNP1DD9BNq2yHgp23ddIGp+O+vzryl1m9RPCA2+v8MeshOEJv3EtBu6eaXST
	QalAGDyj192qnpTuanzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yJQ-0000000GLf5-1Oiw;
	Fri, 11 Sep 2026 10:16:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yJK-0000000GLds-0H0M;
	Fri, 11 Sep 2026 10:16:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6830341776;
	Fri, 11 Sep 2026 10:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B0E1F000FF;
	Fri, 11 Sep 2026 10:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789121805;
	bh=giLIDOVuGk3wU4sINvGbjDY5Co7tru0+JFiE0K9FPLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bAW41siy0jHTB1qfl3qn4gdNLwygOP92sxwRZ5j93bg2aVlvwhPZHWNQXCkbUnxC6
	 9zk3b5mbI7ab2hw7oNcaGXVKHnNx1qFzqMm5NsCPo7iMQTWRRa4ga4/FYZMgemnHMR
	 LUWR9RDzd1jBIAPZg7P5yYAnVdcGzlswz7uYblSZrI8mgcWzefXPuZrclq/aRa18mg
	 UXHtcfHYeWzL2TMktPNfUxYpL9byrk5pz2SSOJ+Hi6IFxR8hMDvGKPZB2iRfKGLL8X
	 ZmrHB9kpMAfbsIpyQlYJu0jR9aIkQQcmQfumaGM+wf3Q1dTyf8WnZzhQjhpzxy2VYs
	 gbIALJ3tDM5qQ==
Date: Fri, 11 Sep 2026 11:16:14 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH 11/39] selinux: reject writable opens of policy file,
 drop mmap shared/write check
Message-ID: <aqPUqU3eZeFrykj3@gremlin>
References: <20260908-b4-mmap-prepare-vma-flag-sanify-v1-0-dacf19cce22b@kernel.org>
 <20260908-b4-mmap-prepare-vma-flag-sanify-v1-11-dacf19cce22b@kernel.org>
 <CAEjxPJ7hXSi=oLtQPV+7GEvN+txfYwZ-u-v_EysNHM0gSGNrCw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEjxPJ7hXSi=oLtQPV+7GEvN+txfYwZ-u-v_EysNHM0gSGNrCw@mail.gmail.com>
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

T24gVGh1LCBTZXAgMTAsIDIwMjYgYXQgMDI6MTE6MThQTSAtMDQwMCwgU3RlcGhlbiBTbWFsbGV5
IHdyb3RlOgo+IE9uIFR1ZSwgU2VwIDgsIDIwMjYgYXQgNDowN+KAr1BNIExvcmVuem8gU3RvYWtl
cyAoQVJNKSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFRoZSBwb2xpY3kgZmlsZSBo
YXMgbm8gd3JpdGUgbWV0aG9kIGFuZCBpcyBleHBvc2VkIHJlYWQtb25seSAoU19JUlVHTyBpbgo+
ID4gc2VsaW51eF9maWxlc1tdKSwgeWV0IHNlbF9vcGVuX3BvbGljeSgpIHBlcmZvcm1zIG5vIG9w
ZW4gbW9kZSBjaGVjaywgc28gYQo+ID4gQ0FQX0RBQ19PVkVSUklERSBjYWxsZXIgY2FuIG9wZW4g
aXQgT19SRFdSLiBSZWplY3QgRk1PREVfV1JJVEUgYXQgb3BlbiwgYXMKPiA+IGtlcm5mcyBkb2Vz
Lgo+ID4KPiA+IFRoZSBmaWxlIGNhbiB0aGVuIG5ldmVyIGJlIG1hcHBlZCB3aXRoIEZNT0RFX1dS
SVRFLCBzbyBkb19tbWFwKCkgYWx3YXlzCj4gPiBjbGVhcnMgVk1fTUFZV1JJVEUgYW5kIFZNX1NI
QVJFRCBmb3IgTUFQX1NIQVJFRCBtYXBwaW5ncyBhbmQgdGhlIFZNX1NIQVJFRAo+ID4gY2hlY2sg
aW4gc2VsX21tYXBfcG9saWN5KCkgY2Fubm90IGJlIHJlYWNoZWQuIFJlbW92ZSBpdC4KPiA+Cj4g
PiBUaGlzIGFsc28gc3RvcHMgc2VsX21tYXBfcG9saWN5KCkgY2xlYXJpbmcgVk1fTUFZV1JJVEUg
b24gYSBtYXBwaW5nIHRoYXQgaXMKPiA+IG5laXRoZXIgYSBQRk4gbWFwIG5vciBhIG1peGVkIG1h
cCwgYWhlYWQgb2YgdGhlIGNvcmUgZW5mb3JjaW5nIHRoYXQgb25seQo+ID4gc3VjaCBtYXBwaW5n
cyBtYXkgZG8gc28uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9ha2VzIChBUk0p
IDxsanNAa2VybmVsLm9yZz4KPgo+IFdlIHNob3VsZCBsaWtlbHkgZG8gc29tZXRoaW5nIHNpbWls
YXIgZm9yIHRoZSBvdGhlciBzZWxfb3Blbl8qKCkgYW5kCj4gc2VsX21tYXBfKigpIGZ1bmN0aW9u
cyB0b28uCj4gSW4gcGFydGljdWxhciwgdHJ1bmNhdGlvbiBvZiB0aGUgc3RhdHVzIGZpbGUgY2Fu
IGJyaW5nIGRvd24gc3lzdGVtZAo+IHNpbmNlIGl0IGlzIG1hcHBlZCBieSBsaWJzZWxpbnV4LgoK
WWVhaCBJIHRoaW5rIHRoZXJlJ3MgZGVmaW5pdGVseSBtb3JlIHRoYXQgY2FuIGJlIGRvbmUgdGhl
cmUuCgpUaG91Z2ggSSB0aGluayBvYnZpb3VzbHkgdGhhdCBraW5kIG9mIHN0dWZmIGlzIGJldHRl
ciBhcyBhIGZvbGxvdyB1cCBhcyB0aGlzCnBhdGNoIGlzIGZvY3VzZWQgb24gZWxpbWluYXRpbmcg
YSBjYXNlIHdoZXJlIFZNQV9NQVlXUklURV9CSVQgaXMgY2xlYXJlZAppbmNvcnJlY3RseS4KCj4K
PiBBY2tlZC1ieTogU3RlcGhlbiBTbWFsbGV5IDxzdGVwaGVuLnNtYWxsZXkud29ya0BnbWFpbC5j
b20+CgpUaGFua3MhCj4KPiA+IC0tLQo+ID4gIHNlY3VyaXR5L3NlbGludXgvc2VsaW51eGZzLmMg
fCAxMSArKystLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDgg
ZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3NlY3VyaXR5L3NlbGludXgvc2VsaW51
eGZzLmMgYi9zZWN1cml0eS9zZWxpbnV4L3NlbGludXhmcy5jCj4gPiBpbmRleCBjN2Q5MTQ3Njk3
MWMuLjU0NWE2Zjg5ZjllNyAxMDA2NDQKPiA+IC0tLSBhL3NlY3VyaXR5L3NlbGludXgvc2VsaW51
eGZzLmMKPiA+ICsrKyBiL3NlY3VyaXR5L3NlbGludXgvc2VsaW51eGZzLmMKPiA+IEBAIC0zNDAs
NiArMzQwLDkgQEAgc3RhdGljIGludCBzZWxfb3Blbl9wb2xpY3koc3RydWN0IGlub2RlICppbm9k
ZSwgc3RydWN0IGZpbGUgKmZpbHApCj4gPiAgICAgICAgIHN0cnVjdCBwb2xpY3lfbG9hZF9tZW1v
cnkgKnBsbSA9IE5VTEw7Cj4gPiAgICAgICAgIGludCByYzsKPiA+Cj4gPiArICAgICAgIGlmIChm
aWxwLT5mX21vZGUgJiBGTU9ERV9XUklURSkKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVB
Q0NFUzsKPiA+ICsKPiA+ICAgICAgICAgcmMgPSBhdmNfaGFzX3Blcm0oY3VycmVudF9zaWQoKSwg
U0VDSU5JVFNJRF9TRUNVUklUWSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgU0VDQ0xB
U1NfU0VDVVJJVFksIFNFQ1VSSVRZX19SRUFEX1BPTElDWSwgTlVMTCk7Cj4gPiAgICAgICAgIGlm
IChyYykKPiA+IEBAIC00MjQsMTQgKzQyNyw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3Bl
cmF0aW9uc19zdHJ1Y3Qgc2VsX21tYXBfcG9saWN5X29wcyA9IHsKPiA+Cj4gPiAgc3RhdGljIGlu
dCBzZWxfbW1hcF9wb2xpY3koc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hKQo+ID4gIHsKPiA+IC0gICAgICAgaWYgKHZtYS0+dm1fZmxhZ3MgJiBWTV9TSEFSRUQp
IHsKPiA+IC0gICAgICAgICAgICAgICAvKiBkbyBub3QgYWxsb3cgbXByb3RlY3QgdG8gbWFrZSBt
YXBwaW5nIHdyaXRhYmxlICovCj4gPiAtICAgICAgICAgICAgICAgdm1fZmxhZ3NfY2xlYXIodm1h
LCBWTV9NQVlXUklURSk7Cj4gPiAtCj4gPiAtICAgICAgICAgICAgICAgaWYgKHZtYS0+dm1fZmxh
Z3MgJiBWTV9XUklURSkKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUFDQ0VT
Owo+ID4gLSAgICAgICB9Cj4gPiAtCj4gPiAgICAgICAgIHZtX2ZsYWdzX3NldCh2bWEsIFZNX0RP
TlRFWFBBTkQgfCBWTV9ET05URFVNUCk7Cj4gPiAgICAgICAgIHZtYS0+dm1fb3BzID0gJnNlbF9t
bWFwX3BvbGljeV9vcHM7Cj4gPgo+ID4KPiA+IC0tCj4gPiAyLjU1LjAKPiA+CgotLQpDaGVlcnMs
IExvcmVuem8KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2Cg==
