Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99673C982D8
	for <kvm-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 15:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqUyKi2BXLvsGCzfYKo2PsTbBjHQ5R4xgfkIOErIxzU=; b=Fv73+H2xVacFlk
	8zwj7izDLP5KjcFZvcEvkMz3gyAPR7CAWu8V171uYyJmcZ6uSppMTT4m3y0+/D9qO8HrUyD0EoEIB
	R1/zgZvpg7jPF8G9rxPeys8w9liOPNBoQpyE7Om0h+1G2d3NXeB/MHmu5zEajH5ATa/5sbHOux9aX
	vvdLG6NyPCW6RJb4DnlwesFVDsOoIgeR8/Es5+rHluYbY1RwPapCSLjAgJ/Wc3e3/wdz8yGDqWJZm
	rewB7qtKIfm7AYvLYl5MV8HAdBDfHueuIhgMHsgBJxAzGyRoo473PpY3IJ28mbUoGSk8A0z+eJhtF
	0NWPPENLeLv+1AYZmNeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7whG-0000000GQik-1C36;
	Sat, 19 Sep 2026 15:09:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7whF-0000000GQiY-0d8k;
	Sat, 19 Sep 2026 15:09:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B486431D0;
	Sat, 19 Sep 2026 15:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48AD71F000FF;
	Sat, 19 Sep 2026 15:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789830584;
	bh=ItRljA0QTwt97l+Rzb+oBvHOLkSySW1764bZK9I66Ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EAnlGaZ3PvA3eD4EGY8ScsYSSfOA3NuPg0sDbUCPy6ciztb4OpKHPUKVNCsw3yYTK
	 F5dXTbBszFDFMx49SBhL74XFEgpDqePel1QPLlEnRPCZHmhKtc3C3Y8QRt4P8RTfDW
	 /Nifcw76qMRhxrrojdmckuYvA7/eR4f0CHw7r1Z9eFzAmLIrY6jMLOX5tLpcIAlRYI
	 ZnXzDASidh8ez3yCFBhWrxVUS9oGdssza/jSZ3fPN118zuj4eAdMjnma5SzA3PTmn0
	 c3g/zkLkVjWHOMPyaaZFTkyX4384FbCqHcB4Ayw2h8F62iRMWX893EQKdX2S78phRH
	 PhATKi1qYFryA==
Date: Sat, 19 Sep 2026 16:09:13 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 00/40] mm: make VMA flag semantics explicit, eliminate
 VM_SPECIAL
Message-ID: <aq6lW9FvL69QeA9H@gremlin>
References: <20260914-b4-mmap-prepare-vma-flag-sanify-v2-0-7d9781ed5361@kernel.org>
 <20260914180811.057cba8fcc48d6e0b53a2683@linux-foundation.org>
 <0b064fe6-ddb3-4f26-a1f2-2e9dd88d590f@kernel.org>
 <CAJuCfpFBichJH4OcmSHTb1rOuQBT6k5pXeua9_KgpWjDBKvsYw@mail.gmail.com>
 <aq6kzpK7wPl3iFGe@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aq6kzpK7wPl3iFGe@gremlin>
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

T24gU2F0LCBTZXAgMTksIDIwMjYgYXQgMDQ6MDU6NTdQTSArMDEwMCwgTG9yZW56byBTdG9ha2Vz
IChBUk0pIHdyb3RlOgo+IE9uIEZyaSwgU2VwIDE4LCAyMDI2IGF0IDAxOjMxOjI0UE0gLTA3MDAs
IFN1cmVuIEJhZ2hkYXNhcnlhbiB3cm90ZToKPiA+IE9uIEZyaSwgU2VwIDE4LCAyMDI2IGF0IDE6
MjHigK9QTSBEYXZpZCBIaWxkZW5icmFuZCAoQXJtKQo+ID4gPGRhdmlkQGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4gPgo+ID4gPiBPbiA5LzE1LzI2IDAzOjA4LCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+
ID4gPiA+IE9uIE1vbiwgMTQgU2VwIDIwMjYgMTU6NTc6MjAgKzAxMDAgIkxvcmVuem8gU3RvYWtl
cyAoQVJNKSIgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+PiBUaGUgVk1f
U1BFQ0lBTCAvIFZNQV9TUEVDSUFMX0ZMQUdTIG1hc2sgY29uZmxhdGVzIHNldmVyYWwgdW5yZWxh
dGVkCj4gPiA+ID4+IHByb3BlcnRpZXM6Cj4gPiA+ID4+Cj4gPiA+ID4+IC4uLgo+ID4gPiA+Pgo+
ID4gPiA+PiBJdCdzIGFsbCByYXRoZXIgYSBtZXNzLgo+ID4gPiA+Pgo+ID4gPiA+PiBUaGlzIHNl
cmllcyBicmluZ3Mgc29tZSBvcmRlciB0byB0aGluZ3MgYnkgYm90aCBsaW1pdGluZyB3aGF0IGRy
aXZlcnMgY2FuCj4gPiA+ID4+IGRvIHdpdGggVk1BIGZsYWdzIGFuZCBzd2l0Y2hpbmcgdG8gdXNp
bmcgcHJlZGljYXRlcyB0aGF0IGRlc2NyaWJlCj4gPiA+ID4+IGJlaGF2aW91ciwgbm90IGFyYml0
cmFyeSBmbGFncy4KPiA+ID4gPgo+ID4gPiA+IFRoYXQncyBhIGxvdCBvZiBwYXRjaGVzLgo+ID4g
PiA+Cj4gPiA+ID4gUmV2aWV3IGlzIHRoaW4gYW5kIEkgZXhwZWN0IHRoaXMgd29uJ3QgaW1wcm92
ZSBhIGxvdC4gIExvdHMgb2YgIm5vCj4gPiA+ID4gZnVuY3Rpb25hbCBjaGFuZ2VzIiBjaGFuZ2Vz
Lgo+ID4gPgo+ID4gPiBJJ2xsIGV4cGVjdCB0byBnbyB0aHJvdWdoIGFsbCBvZiB0aGVtLiBNaWdo
dCBqdXN0IHRha2UgYSBiaXQgOykKPiA+Cj4gPiBkaXR0bwo+Cj4gVGhhbmtzIGd1eXMhCgpOb3Rl
IHYzIGhhcyBiZWVuIHBvc3RlZCB0byBmaXggYSBzdHVwaWQgYnVnIGluIDEvNDAgKyBhdHRhY2sg
c29tZSB2ZXJ5IHRyaXZpYWwKc2FzaGlrbyBzdHVmZgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtbW0vMjAyNjA5MTctYjQtbW1hcC1wcmVwYXJlLXZtYS1mbGFnLXNhbmlmeS12My0wLTQ1
ODNkOGEyM2JjYUBrZXJuZWwub3JnLwoKPgo+ID4KPiA+ID4KPiA+ID4gLS0KPiA+ID4gQ2hlZXJz
LAo+ID4gPgo+ID4gPiBEYXZpZAo+Cj4gLS0KPiBDaGVlcnMsIExvcmVuem8KCi0tCkNoZWVycywg
TG9yZW56bwoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
