Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A8EC9830D
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 09:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=28/JWCt+ViBCmcxpHBMZDWmdB7rIfGRAgYLMLZq8CHg=; b=yhlEU9Kj8OcmRt
	2cGsU9bbGb+dZ7Dhe278nqG47pK3A5KgUE2pGJSPllenGfsdShCH6p8JNG4mI5o7jnomJrwKjQof/
	9YvctFAIKESXc1cEluDYd9CZ1yiXvI9KGrNNOJWuzL9A2AI4Ih1zF+2McO6BodcLtyesoW7ii+3BO
	+dCRS3EfO9sLjBOrkIDQtm1Cq2vz9gv1iL0hm4jJTltueRSXHXQeiIXCl9kK3e40DMfJrApXYF/qd
	oV0YpxIo+XV0UO2wd2NKRCsO4zNtwck+N9ilNzAhDov+WD+TqiR2S1Q9hG46IB01y+IUwQhpT+PZU
	7Rw6ZQRc/a6o8+QhEgwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2dO-0000000D3qx-492i;
	Fri, 25 Sep 2026 09:54:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2dN-0000000D3ps-1e3X;
	Fri, 25 Sep 2026 09:54:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E0DB941A8C;
	Fri, 25 Sep 2026 09:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ABF21F00893;
	Fri, 25 Sep 2026 09:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790330064;
	bh=F26o3Lz6j0FulgVu/J70FouYk+xm4Aj0BzlXmkWYx74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MsAuqFOOx+AF1dgN+IqsXkW8tPskls72sr+6/efWMWpfVIAlZSDWLuBHTrLZClhgG
	 q/dIOEfA2AyCRm9jA5KWXH0p9qG5z3u3QSSdut4cDfuHJ9MY2s5zp+Of3VIDKk9aQh
	 cjBRq0th+AWyc2+NbiAThoZzNXCNSNida0MNqGcbx/Gp+nAuExhBiSODnPz+COmnw9
	 Q5xFbgOZ6EBRN1Z/dgGPytz/TJE4uK9b62Ug/ZoKT2bY5zp22H3YyXonIbjvgfMmsP
	 Ity7rFv41f14MLa4FLJtZ16dM7J7DZuG6gjVmfVxCKHLOVNegP/UQM/eBy2REvzB/4
	 t2NDXRrsRj7PA==
Date: Fri, 25 Sep 2026 10:53:53 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 05/40] mm/vma: ensure mmap_prepare doesn't set actions
 on a mergeable vma
Message-ID: <arZEKkLGpHNQX3Jg@gremlin>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-5-4583d8a23bca@kernel.org>
 <CAJuCfpF2U9rgHmhaDoXX1hxsuuS=s-oWK9Nk19TDQ6CLpjhFVA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpF2U9rgHmhaDoXX1hxsuuS=s-oWK9Nk19TDQ6CLpjhFVA@mail.gmail.com>
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

T24gRnJpLCBTZXAgMjUsIDIwMjYgYXQgMTI6Mjg6NDlBTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2Fy
eWFuIHdyb3RlOgo+IE9uIFRodSwgU2VwIDE3LCAyMDI2IGF0IDk6MjXigK9BTSBMb3JlbnpvIFN0
b2FrZXMgKEFSTSkgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBXaGVuIGEgdXNlciBy
ZXF1ZXN0cyBhbiBtbWFwX2FjdGlvbiBiZSBwZXJmb3JtZWQgaW4gbW1hcF9wcmVwYXJlLCB0aGlz
Cj4gPiBpbnZvbHZlcyBwb3B1bGF0aW5nIHRoZSBWTUEgcmFuZ2Ugd2l0aCBkYXRhLgo+ID4KPiA+
IEhvd2V2ZXIsIGlmIHRoZSBWTUEgaXMgbWVyZ2VhYmxlLCBpdCBtaWdodCB0aGVuIG1pc3Rha2Vu
bHkgYmUgbWVyZ2VkIHdpdGgKPiA+IGFub3RoZXIgVk1BIHdpdGhvdXQgaGF2aW5nIHBvcHVsYXRl
ZCB0aGUgcmFuZ2UuCj4gPgo+ID4gRXZlcnkgbW1hcCBhY3Rpb24gY3VycmVudGx5IGF2YWlsYWJs
ZSBzZXRzIFZNQSBmbGFncyBzdWNoIHRoYXQgdGhlIFZNQQo+ID4gY2Fubm90IGJlIG1lcmdlZC4K
PiA+Cj4gPiBIb3dldmVyLCB0byBlbnN1cmUgdGhhdCBubyBmdXR1cmUgbW1hcCBhY3Rpb24gZmFs
bHMgZm91bCBvZiB0aGlzLCBhc3NlcnQKPiA+IHRoYXQgdGhpcyBpcyB0aGUgY2FzZSB1cG9uIG1t
YXBfcHJlcGFyZSB2YWxpZGF0aW9uLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gU3Rv
YWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5vcmc+Cj4KPiBSZXZpZXdlZC1ieTogU3VyZW4gQmFnaGRh
c2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KClRoYW5rcyEKCj4KPiA+IC0tLQo+ID4gIG1tL3Zt
YS5jIHwgOSArKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL21tL3ZtYS5jIGIvbW0vdm1hLmMKPiA+IGluZGV4IGQ2ZWQxMGNl
ZmM4Zi4uNjJmMmNlMWFkNWExIDEwMDY0NAo+ID4gLS0tIGEvbW0vdm1hLmMKPiA+ICsrKyBiL21t
L3ZtYS5jCj4gPiBAQCAtMjgwOSw2ICsyODA5LDE1IEBAIHN0YXRpYyBpbnQgbW1hcF92YWxpZGF0
ZSh1bnNpZ25lZCBsb25nIHByZXZfc3RhcnQsIHVuc2lnbmVkIGxvbmcgcHJldl9lbmQsCj4gPiAg
aW50IG1tYXBfcHJlcGFyZV92YWxpZGF0ZShjb25zdCBzdHJ1Y3Qgdm1fYXJlYV9kZXNjICpwcmV2
X2Rlc2MsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB2bV9hcmVh
X2Rlc2MgKmRlc2MpCj4gPiAgewo+ID4gKyAgICAgICAvKgo+ID4gKyAgICAgICAgKiBJdCBpcyBu
b3QgdmFsaWQgdG8gZXhlY3V0ZSBtbWFwIGFjdGlvbnMgZm9yIFZNQXMgd2hpY2ggY2FuIGJlIG1l
cmdlZCwKPiA+ICsgICAgICAgICogYXMgYW55IHN1Y2ggbWVyZ2Ugd291bGQgbGVhdmUgcG9ydGlv
bnMgb2YgdGhlIG1hcHBpbmcgaW5jb3JyZWN0bHkKPiA+ICsgICAgICAgICogdW5tYXBwZWQuCj4g
PiArICAgICAgICAqLwo+ID4gKyAgICAgICBpZiAodm1hX2ZsYWdzX2Nhbl9tZXJnZSgmZGVzYy0+
dm1hX2ZsYWdzKSAmJgo+ID4gKyAgICAgICAgICAgV0FSTl9PTl9PTkNFKGRlc2MtPmFjdGlvbi50
eXBlICE9IE1NQVBfTk9USElORykpCj4KPiBBbnkgcmVhc29uIHlvdSBjaG9zZSB0aGlzICJpZiAo
QSAmJiBXQVJOX09OX09OQ0UoQikpIiBwYXR0ZXJuIGluc3RlYWQKPiBvZiBhIHNpbXBsZXIgImlm
IChXQVJOX09OX09OQ0UoQSAmJiBCKSkiPyBVbmxlc3MgdGhlcmUgYXJlIHJhY2VzCj4gYmV0d2Vl
biBBIGFuZCBCIHVwZGF0ZXMsIEkgdGhpbmsgdGhlc2Ugd291bGQgYmUgZXF1aXZhbGVudCwgcmln
aHQ/CgpUaGV5IGFyZSBlcXVpdmFsZW50IHllcyEKClNvIGl0J3MgbW9yZSBvZiBhIHN0eWxlIHRo
aW5nLCBhcyB0aGF0IHJlYWRzIGxlc3MgY2xlYXJseSB0byBtZToKCglpZiAoV0FSTl9PTl9PTkNF
KHZtYV9mbGFnc19jYW5fbWVyZ2UoJmRlc2MtPnZtYV9mbGFncykgJiYKCQkJIGRlc2MtPmFjdGlv
bi50eXBlICE9IE1NQVBfTk9USElORykpCgpBbmQgdGhpcyB2ZXJzaW9uIGhpZ2hsaWdodHMgd2hh
dCBpcyB0aGUgYnJva2VuIHRoaW5nIGhlcmUgKGFjdGlvbiB0eXBlIHNldCkgYQpsaXR0bGUgbW9y
ZSBjbGVhcmx5IHRob3VnaCBvYnZpb3VzbHkgdGhhdCdzIG9ubHkgaWYgbWVyZ2VhYmxlIHNvIGFy
Z3VhYmxlLgoKSSBkb24ndCBoYXZlIGEgcmVhbGx5IHN0cm9uZyBvcGluaW9uIHRob3VnaCBJIGNh
biBjaGFuZ2UgaXQgaWYgeW91IHByZWZlcj8KCj4KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPiA+ICsKPiA+ICAgICAgICAgcmV0dXJuIG1tYXBfdmFsaWRhdGUocHJldl9kZXNj
LT5zdGFydCwgcHJldl9kZXNjLT5lbmQsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGRlc2MtPnN0YXJ0LCBkZXNjLT5lbmQsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICZwcmV2X2Rlc2MtPnZtYV9mbGFncywgJmRlc2MtPnZtYV9mbGFncyk7Cj4gPgo+ID4gLS0KPiA+
IDIuNTUuMAo+ID4KCi0tCkNoZWVycywgTG9yZW56bwoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxp
c3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
