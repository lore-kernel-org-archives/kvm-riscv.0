Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789D9CA601D
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 16:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eXFFgFBBT6O902IsC1MYvn7gpFGeiKLaiRmekBra6/Q=; b=jBGe+vTpSVRFnL
	7A9hNd65z4tiYaYwa8c9RF0jYpeyC6cTiQ7PoMHAlPfWyBSu5txriYxXd4cwOLvayocTDtyZg+iS5
	tUI9KxinJ3lQkKFmUEj6N1S4PVa8NsPMuzdCNMyZT/OUBPmqGIe6grDPIk+j9vCVqGYVTLV3UxFua
	wnHhL/Y3FKgiETy0mj0iVk8T1+h/SdJasfWc4JfQr1zsfB4p6IVoy1xKy36N3hn0IZ+ObxikTY//c
	HFglEKihDNkoF3coaYyTEhM46EcvfZFcGiPmIRTceHYWJk3FLr6g64yieY4lfoELnDq8obDfY5YUB
	BEu6SW7b142fHXU+6Q/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDtZ-00000006hUN-46dE;
	Fri, 09 Oct 2026 16:56:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDtY-00000006hU5-0xlO;
	Fri, 09 Oct 2026 16:56:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 646786053E;
	Fri,  9 Oct 2026 16:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2421F000FF;
	Fri,  9 Oct 2026 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791564991;
	bh=fE0OAfD+VvZZQlsp7SZETT3KsGTWZ99jT3uHHIgYDkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RUsl9XnUQdex4hYDI/nvqZumtgOTjlWiX0N56fVGal9ZXTElbzreII28hFeRkApJB
	 NHo6FTkv1s0R1SKHMxFh2yoyGgEj94FI2YTZ5R2m7lwDx9O3N5/dtVzHCZ7rRFHg+b
	 AtSEfYi+n++t5xP6H8VImwwnXKYhoLn2R1W0Koa99MOWI+o8HHqK2kIurxPlAU0Yri
	 ygANXuDjupNkgl+uor72EiN8FZ3fmo02D0/KSu5wQ2x84hwaNSlHgKIyyR/PugD/c9
	 1rQuaM8k2AyO9mDtnEOKbWctVlZ0WY0IhSQdg1dl1SdQIKXtdsg79DgnHAMkLcGLF5
	 UTDY8ujTUNlMg==
Date: Fri, 9 Oct 2026 17:56:08 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v4 07/38] mm: add mmap action for discontiguous kernel
 page mapping
Message-ID: <askajMD6aWnRZzwK@gremlin>
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-7-a1f052500fd7@kernel.org>
 <CAJuCfpGj2Q092+zB=Z-d1iAOD6n1_HXVZQAL+YM6x_CeUEMpcw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpGj2Q092+zB=Z-d1iAOD6n1_HXVZQAL+YM6x_CeUEMpcw@mail.gmail.com>
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

T24gU3VuLCBPY3QgMDQsIDIwMjYgYXQgMTA6MTE6MThBTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2Fy
eWFuIHdyb3RlOgo+IE9uIFNhdCwgT2N0IDMsIDIwMjYgYXQgNjozNeKAr1BNIExvcmVuem8gU3Rv
YWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiA+IGRpZmYgLS1naXQgYS9tbS9t
ZW1vcnkuYyBiL21tL21lbW9yeS5jCj4gPiBpbmRleCA0NDgzNDI4ODNlOWQuLjQ1YjIxYmIwNGEx
OCAxMDA2NDQKPiA+IC0tLSBhL21tL21lbW9yeS5jCj4gPiArKysgYi9tbS9tZW1vcnkuYwoKPiA+
ICtzdGF0aWMgdm9pZCBfX21hcF9rZXJuZWxfcGFnZXNfcHJlcGFyZShzdHJ1Y3Qgdm1fYXJlYV9k
ZXNjICpkZXNjKQo+ID4gK3sKPiA+ICsgICAgICAgaWYgKHZtYV9kZXNjX3Rlc3QoZGVzYywgVk1B
X01JWEVETUFQX0JJVCkpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKwo+ID4gKyAg
ICAgICBWTV9XQVJOX09OX09OQ0UobW1hcF9yZWFkX3RyeWxvY2soZGVzYy0+bW0pKTsKPgo+IFNv
cnJ5IEkgbWlzc2VkIHRoaXMgYmVmb3JlIGFuZCBpdCBpcyBwcmUtZXhpc3RpbmcgY29kZSBidXQg
aXMgdGhpcyBhCj4gd2VpcmQgd2F5IG9mIGFzc2VydGluZyB0aGF0IG1tYXBfbG9jayBpcyB3cml0
ZS1sb2NrZWQ/IElmIHNvLCB3aHkgbm90Cj4ganVzdCB1c2UgbW1hcF9hc3NlcnRfd3JpdGVfbG9j
a2VkKCk/CgpBaCB5ZWFoLCB0aGlzIHdlaXJkbmVzcyBpcyBkdXBsaWNhdGVkIGZyb20gdGhlIGV4
aXN0aW5nIGNvZGUuIFdpbGwgZml4IHVwIG9uCnJlc2luIQoKLS0KQ2hlZXJzLCBMb3JlbnpvCgot
LSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
