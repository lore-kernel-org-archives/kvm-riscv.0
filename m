Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000BAC982D8
	for <kvm-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 15:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=smQ+sJ8LBMllf6dVNb9svEu6xOwvRPfFNi5r9kWUaIs=; b=afNHLzyJjhSJ9W
	8SzGhTxpQnoiTxaoBuyvSuW79lWrQEnp1iv1Nme/irDNVDhLGtqSVXj5k8RLU3PQTjvZ9zb5blThj
	wma3xV+lY7LDgmllX2MaMlzDx+vBiFBOLTNP9boyeg8FeVhgqEmWnTMpq2D4cDNottJLaRKd0Dcih
	oA+ktMgS21r3p1djrczUNshwtV/e3ZEWpvwWIazKbZiS/8E0JDea9ScImMNbUXbDvTaqh3na3dRzW
	IoIy0DlJ86Siz3In5CTWdnJoDx2XqyglKSvhJquMcFYlppZmG9gNCwkOsvMHr6qpcEXL4hqbUR2z6
	bwK4bFDZ6irU4+MnNUsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7we7-0000000GQa1-1uNJ;
	Sat, 19 Sep 2026 15:06:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7we6-0000000GQZm-0uV0;
	Sat, 19 Sep 2026 15:06:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C285B60AA4;
	Sat, 19 Sep 2026 15:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E8F1F000FF;
	Sat, 19 Sep 2026 15:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789830388;
	bh=6E/2ltl35xPsVBq7dCp8kX3P3iYtwP2nwvmHYrMGiao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mZ7NEov07DW0ZDR9skjWGGxQUM0tilYV9cJ7x872u31P1qu1yVnwdU0E77jSYzczU
	 Rq0n7dEgh+A9eWTU+kdQxDU5tKshnvcxTa3XN1JDv7zPJ7mxY5KgfDql95Wg5316wn
	 kqxgLNkCZWg1I6A6O0IhltPcOlOLcVqsjbFRvGscwxEQOwDG8XewmgyU6Ujr9SqTuc
	 zEYCMum6E9yTv2amUuljbVi6GJTLEO9nOY5NLyIChsn3u7MRozdIRj+bylE4/Ua89o
	 aFiTM/yy7p1O+kilDkoW7RGJH5LX4eZ8RZkWZXZPSrDaZInSmA804tyjxuFh+fgV9t
	 5tO9QHfxFsFFQ==
Date: Sat, 19 Sep 2026 16:05:57 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 00/40] mm: make VMA flag semantics explicit, eliminate
 VM_SPECIAL
Message-ID: <aq6kzpK7wPl3iFGe@gremlin>
References: <20260914-b4-mmap-prepare-vma-flag-sanify-v2-0-7d9781ed5361@kernel.org>
 <20260914180811.057cba8fcc48d6e0b53a2683@linux-foundation.org>
 <0b064fe6-ddb3-4f26-a1f2-2e9dd88d590f@kernel.org>
 <CAJuCfpFBichJH4OcmSHTb1rOuQBT6k5pXeua9_KgpWjDBKvsYw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpFBichJH4OcmSHTb1rOuQBT6k5pXeua9_KgpWjDBKvsYw@mail.gmail.com>
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

T24gRnJpLCBTZXAgMTgsIDIwMjYgYXQgMDE6MzE6MjRQTSAtMDcwMCwgU3VyZW4gQmFnaGRhc2Fy
eWFuIHdyb3RlOgo+IE9uIEZyaSwgU2VwIDE4LCAyMDI2IGF0IDE6MjHigK9QTSBEYXZpZCBIaWxk
ZW5icmFuZCAoQXJtKQo+IDxkYXZpZEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiA5LzE1
LzI2IDAzOjA4LCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+ID4gPiBPbiBNb24sIDE0IFNlcCAyMDI2
IDE1OjU3OjIwICswMTAwICJMb3JlbnpvIFN0b2FrZXMgKEFSTSkiIDxsanNAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPiA+Cj4gPiA+PiBUaGUgVk1fU1BFQ0lBTCAvIFZNQV9TUEVDSUFMX0ZMQUdTIG1h
c2sgY29uZmxhdGVzIHNldmVyYWwgdW5yZWxhdGVkCj4gPiA+PiBwcm9wZXJ0aWVzOgo+ID4gPj4K
PiA+ID4+IC4uLgo+ID4gPj4KPiA+ID4+IEl0J3MgYWxsIHJhdGhlciBhIG1lc3MuCj4gPiA+Pgo+
ID4gPj4gVGhpcyBzZXJpZXMgYnJpbmdzIHNvbWUgb3JkZXIgdG8gdGhpbmdzIGJ5IGJvdGggbGlt
aXRpbmcgd2hhdCBkcml2ZXJzIGNhbgo+ID4gPj4gZG8gd2l0aCBWTUEgZmxhZ3MgYW5kIHN3aXRj
aGluZyB0byB1c2luZyBwcmVkaWNhdGVzIHRoYXQgZGVzY3JpYmUKPiA+ID4+IGJlaGF2aW91ciwg
bm90IGFyYml0cmFyeSBmbGFncy4KPiA+ID4KPiA+ID4gVGhhdCdzIGEgbG90IG9mIHBhdGNoZXMu
Cj4gPiA+Cj4gPiA+IFJldmlldyBpcyB0aGluIGFuZCBJIGV4cGVjdCB0aGlzIHdvbid0IGltcHJv
dmUgYSBsb3QuICBMb3RzIG9mICJubwo+ID4gPiBmdW5jdGlvbmFsIGNoYW5nZXMiIGNoYW5nZXMu
Cj4gPgo+ID4gSSdsbCBleHBlY3QgdG8gZ28gdGhyb3VnaCBhbGwgb2YgdGhlbS4gTWlnaHQganVz
dCB0YWtlIGEgYml0IDspCj4KPiBkaXR0bwoKVGhhbmtzIGd1eXMhCgo+Cj4gPgo+ID4gLS0KPiA+
IENoZWVycywKPiA+Cj4gPiBEYXZpZAoKLS0KQ2hlZXJzLCBMb3JlbnpvCgotLSAKa3ZtLXJpc2N2
IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
