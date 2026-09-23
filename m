Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A130CC9830B
	for <kvm-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPBRH1VEbaxTOErqWpEVwUYmklp3Wr3G7nMiRT7IX00=; b=XOnbtw7SQu1J2q
	T7eYVZefbzGyqPxEXZygBEjlqGCgxfB11oW/xiJyMFOcbWdxAcf9RHVbs97nIWytc1Sqcu3JxwZG2
	dYyDitOieRY0BIrJXO+5P9MLgsmjCpGkztJdyxjTpOWNjaHSNE6AcGz1iKzsnFzx27QoqhVk1Ii5g
	JGkJwePQRau/abhPYPEvWRcESCGWSKa/RZ25A8n0rGB/ptDl1Q0q5aws3s/Q+7LyMg0yB25RQvrUF
	SHfG9I1iIR+VRvVBwNs05tf4XqFX1kjt/DPe2ftI89n3QgROcCX5UUaNutPCdjDQ6wECfsfwpm0Hf
	qVirwpptpNSrSfHeKD/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PIN-00000008oNp-3lBM;
	Wed, 23 Sep 2026 15:54:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PIM-00000008oN3-1uzA;
	Wed, 23 Sep 2026 15:54:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8525560AB6;
	Wed, 23 Sep 2026 15:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF3C1F000FF;
	Wed, 23 Sep 2026 15:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790178845;
	bh=wAV8stNGXVD0suD8B1a8qtsl7mm0RfyqHixhi/NZx3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kO69tl0GVqEJBDtzXtj722GeS02r981KicvQg4cQHtdo8zYbHSuzX4xKugLSuxZ80
	 hNKF+inpI1rG93f1F5QhrTtVFxLcKRCTL+snyRWCp/N/q3HEczsFeIqExmwrr7tt/Y
	 BvYVVTOYIPgApkyrBXMn24Qh05xMwuFcGHVzqgJTNe/gle65zMUCXYN6+65S4HSHY7
	 tGBuhIwWJ1Pazb14YseddKo0V64lXM6Wy4pe1LmUGi7p3l+GZYljbhlHPVyxqBuygF
	 nqC8DLo3R+mPNhwr+2JNkPsIA6gODez9Nt0VUzmMq2DMdlQhA1/ymS6rMHMT1y9mfa
	 Lr1sgEWelyeVQ==
Date: Wed, 23 Sep 2026 16:53:33 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 02/40] mm/vma: predicate setting mmap_prepare VMA
 fields on new vma alloc
Message-ID: <arP0oJgrgZlgtrb6@gremlin>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-2-4583d8a23bca@kernel.org>
 <CAJuCfpEa8tUmYJBjx-cRdAE8y-jcKY0C81kAOa1QZS7F6tKdfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpEa8tUmYJBjx-cRdAE8y-jcKY0C81kAOa1QZS7F6tKdfQ@mail.gmail.com>
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

T24gV2VkLCBTZXAgMjMsIDIwMjYgYXQgMDg6MzI6NDNBTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2Fy
eWFuIHdyb3RlOgo+IE9uIFRodSwgU2VwIDE3LCAyMDI2IGF0IDk6MjTigK9BTSBMb3JlbnpvIFN0
b2FrZXMgKEFSTSkgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBJdCBvbmx5IG1ha2Vz
IHNlbnNlIHRvIG1hbmlwdWxhdGUgVk1BIGZpZWxkcyBpZiB3ZSBhbGxvY2F0ZWQgYSBuZXcgVk1B
LAo+ID4gcmF0aGVyIHRoYW4gbWVyZ2VkIGl0Lgo+ID4KPiA+IFZNQSBtZXJnaW5nIGRvZXMgbm90
IGNvbXBhcmUgdm1fb3BzIG9yIHZtX3ByaXZhdGVfZGF0YSwgc28gYSBtZXJnZWQgVk1BCj4gPiBr
ZWVwcyBpdHMgb3duLCB3aGljaCBpcyBhbHNvIHdoYXQgdGhlIGxlZ2FjeSBmX29wLT5tbWFwIHBh
dGggZG9lcyBzaW5jZSBpdAo+ID4gbmV2ZXIgdG91Y2hlcyBhbiBleGlzdGluZyBWTUEuIFByZXZp
b3VzbHkgc2V0X3ZtYV91c2VyX2RlZmluZWRfZmllbGRzKCkKPiA+IG92ZXJ3cm90ZSB0aGUgbWVy
Z2VkIFZNQSdzIGZpZWxkcyB3aXRoIHRob3NlIHNldCBmb3IgdGhlIG5ldyBtYXBwaW5nLiBJbgo+
ID4gcHJhY3RpY2UgdGhlc2UgYXJlIHRoZSBzYW1lIHZhbHVlcywgd2l0aCByYXJlIGV4Y2VwdGlv
bnMgc3VjaCBhcyBzaG1lbQo+ID4gc2VsZWN0aW5nIHZtX29wcyBiYXNlZCBvbiB3aGV0aGVyIHRo
ZSBmaWxlIGhhcyBiZWVuIHVubGlua2VkLCBzbyBubwo+ID4gdXNlci12aXNpYmxlIGNoYW5nZSBp
cyBleHBlY3RlZC4KPiA+Cj4gPiBNYWtlIHRoaXMgZGVwZW5kZW5jeSBleHBsaWNpdCwgYW5kIGFk
ZGl0aW9uYWxseSBjb25zdGlmeSBoYXZlX21tYXBfcHJlcGFyZQo+ID4gd2hpbGUgd2UncmUgaGVy
ZS4KPgo+IFRoZSBmYWN0IHRoYXQgd2UgbWlnaHQgYmUgb3ZlcnJpZGluZyBhdHRyaWJ1dGVzIG9m
IGFuIGV4aXN0aW5nIFZNQQo+IHRoYXQgd2UgbWVyZ2VkIHdpdGggaXMgdGVjaG5pY2FsbHkgYSBi
dWcgZXZlbiBpZiB3ZSBuZXZlciBoaXQgaXQsCj4gcmlnaHQ/IElmIHNvLCBzaG91bGQgd2UgaGF2
ZToKPgo+IEZpeGVzOiBjODRiZjZkZDJiODMgKCJtbTogaW50cm9kdWNlIG5ldyAubW1hcF9wcmVw
YXJlKCkgZmlsZSBjYWxsYmFjayIpCgpJdCdzIG5vdCBhIGJ1ZywgaXQgaXMgYW4gaW4tYnVpbHQg
YXNzdW1wdGlvbiB0aGF0IHRoZSBzdGF0ZSB1c2VkIHRvIGFzc2VzcwptZXJnZWFiaWxpdHkgaW1w
bGllcyB0aGUgc2FtZSBwcm9wZXJ0aWVzLgoKQW5kIGlmIGl0IHdhcywgaXQnZCBuZWVkIGZpeGlu
ZyBhIGRpZmZlcmVudCB3YXkgKGNoZWNrIHRoZSBmaWVsZCBmb3IgaW5zdGFuY2UpCmFuZCB3b3Vs
ZCBhcHBseSB0byB0aGUgbGVnYWN5IG1tYXAgaG9vayBhbHNvLgoKVGhpcyBjaGFuZ2UgaXMgbmVl
ZGVkIGZvciB0aGUgc2VyaWVzIHRob3VnaC4KCj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMb3Jl
bnpvIFN0b2FrZXMgKEFSTSkgPGxqc0BrZXJuZWwub3JnPgo+Cj4gUmV2aWV3ZWQtYnk6IFN1cmVu
IEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+CgpUaGFua3MhCgo+Cj4gPiAtLS0KPiA+
ICBtbS92bWEuYyB8IDQgKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL21tL3ZtYS5jIGIvbW0vdm1hLmMK
PiA+IGluZGV4IGZhNzg0ZjA2OWRhNC4uNGI3NGI0OGMyOWI3IDEwMDY0NAo+ID4gLS0tIGEvbW0v
dm1hLmMKPiA+ICsrKyBiL21tL3ZtYS5jCj4gPiBAQCAtMjg5NCw3ICsyODk0LDcgQEAgc3RhdGlj
IHVuc2lnbmVkIGxvbmcgX19tbWFwX3JlZ2lvbihzdHJ1Y3QgZmlsZSAqZmlsZSwgdW5zaWduZWQg
bG9uZyBhZGRyLAo+ID4gIHsKPiA+ICAgICAgICAgc3RydWN0IG1tX3N0cnVjdCAqbW0gPSBjdXJy
ZW50LT5tbTsKPiA+ICAgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEgPSBOVUxMOwo+
ID4gLSAgICAgICBib29sIGhhdmVfbW1hcF9wcmVwYXJlID0gZmlsZSAmJiBmaWxlLT5mX29wLT5t
bWFwX3ByZXBhcmU7Cj4gPiArICAgICAgIGNvbnN0IGJvb2wgaGF2ZV9tbWFwX3ByZXBhcmUgPSBm
aWxlICYmIGZpbGUtPmZfb3AtPm1tYXBfcHJlcGFyZTsKPiA+ICAgICAgICAgVk1BX0lURVJBVE9S
KHZtaSwgbW0sIGFkZHIpOwo+ID4gICAgICAgICBjb25zdCBwZ29mZl90IGFub25fcGdvZmYgPSBh
ZGRyID4+IFBBR0VfU0hJRlQ7Cj4gPiAgICAgICAgIE1NQVBfU1RBVEUobWFwLCBtbSwgJnZtaSwg
YWRkciwgbGVuLCBwZ29mZiwgYW5vbl9wZ29mZiwgdm1hX2ZsYWdzLCBmaWxlKTsKPiA+IEBAIC0y
OTM3LDcgKzI5MzcsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBfX21tYXBfcmVnaW9uKHN0cnVj
dCBmaWxlICpmaWxlLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gPiAgICAgICAgICAgICAgICAgYWxs
b2NhdGVkX25ldyA9IHRydWU7Cj4gPiAgICAgICAgIH0KPiA+Cj4gPiAtICAgICAgIGlmIChoYXZl
X21tYXBfcHJlcGFyZSAmJiAhbWFwX2lzX2Fub24oJm1hcCkpCj4gPiArICAgICAgIGlmIChoYXZl
X21tYXBfcHJlcGFyZSAmJiBhbGxvY2F0ZWRfbmV3ICYmICFtYXBfaXNfYW5vbigmbWFwKSkKPiA+
ICAgICAgICAgICAgICAgICBzZXRfdm1hX3VzZXJfZGVmaW5lZF9maWVsZHModm1hLCAmbWFwKTsK
PiA+Cj4gPiAgICAgICAgIF9fbW1hcF9jb21wbGV0ZSgmbWFwLCB2bWEpOwo+ID4KPiA+IC0tCj4g
PiAyLjU1LjAKPiA+CgotLQpDaGVlcnMsIExvcmVuem8KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBs
aXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
