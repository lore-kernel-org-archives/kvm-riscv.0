Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005BCCA5FE6
	for <kvm-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 18:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVfI5VVkX9jdl8ahR9uIMCEXdzlO1l4LAMNamYnK3ug=; b=mBnKBevH6QrunB
	piGJ34pQBnOGCTrHWy7wEvo8V8Pn9FfjEg15huLOKsI5WhEqYlYXLaIPT6c7X3ZjnRUqGMrIpFQuG
	tD3wj6hONfzkq/yBHR4M7RM9ehVPDdA6GY4iK3Hr0zxzKNSgCmt5weeCWL+VM/+dppKBSMf48lZwt
	N8W/B2tlqFEDL73Y3I0umZ6WX8AWnW+goBwh7296qf9POWZKjoo8FGqPki0Wid5f/S77yD3twjgNz
	uMy6RbMJnQjK60E8imn6VUQktaVNZPjfh4SFwdBz+ijdErz+Tty0x0XE/rdUbC9kVEzAqqLDn+j4r
	VEdcha/BCJ05l0N1dO6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQXT-0000000F9Hc-2keg;
	Sun, 04 Oct 2026 18:02:19 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQXQ-0000000F9GX-1t7e
	for kvm-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 18:02:18 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-5337fa12431so184171cf.1
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Oct 2026 11:02:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791136935; cv=none;
        d=google.com; s=arc-20260327;
        b=VuMy0HPduEGuW97atMnV9Nn4I1vEMWJnCzdTfqpL/kJx9uN4FTu2MOPL0olyYx/2Yv
         XENPzZzwETprx12o0gag8PgAsUpNNlESq8sLnW+3M09bjWT/6yuJ1U+38e4RqPN3CM9c
         PpoLOba0HJ5Y6Hr+iv7OIoBhToeSbcJNwOHIz7ngKe4w123yIOxUb7EL/TyAM0kjSCL0
         qh4rzNNvAa5Obt8v0TK+kWxrshE29zU1pE4FF85KyFcG/56dWT1747cqR5cAKAF/pl0C
         O4p4BQB3sxbC5L7dzO+VznrltnwRneJrMTLUCQYrKzzAWIOFqHfPzEwU9ESGCF0QIrYP
         j0gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fxl6gThguTjmryCDwAa1VxSTqh72eFueCyhgsTktke8=;
        fh=oIiPK0wx4OoutyBfyno9i3AZJ+zxKAu8T4k84zAqaPg=;
        b=GBStaNK1dpVAmOi/WkcOfOjCtHCXCYmQ3nwMOtTdC0ICP0bIqp5GClX2VMZN6jib4i
         H2BrPtMzTaKqeWLmOMEJwEu+LAMmbTQThzmYXq0rxLBTfzWoHo2PWBmhKNNOc45q/MyQ
         ppK5ZlEVav45Ls1fxBplC/26F2AlWG5lh5AFxQvjSw2+o2VNSbJz8iwh25pxHy1gngqI
         5NGl5ijEVJSTjPu0a6/1GNkAieDDro9C5oLNioKwlxFKP/spFoBZQB7BuyO9gwrRjFWW
         LiFt5MO9H52HvFQfO5BKSPWVZ/Ul9aqRV95soR7b1wJF3X2N81edEAPaQW7+r2pgVrqO
         tBGg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791136935; x=1791741735; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fxl6gThguTjmryCDwAa1VxSTqh72eFueCyhgsTktke8=;
        b=DvJygMoiOXBnVkvJ0eKr6JIKXi7+O3G28lIh2mVizQojzBEM49CZT/TMLrEwj5YVGY
         KO9+q6v4KOSWh5ehMifoKSQV33BtT2BmvIjowzGUDL3DteTz1wTUzCO9vXHyDNGOfX2k
         H20iVvz610H3ijMMkYjBvWDYBNOulcUBi1f/DMiTW41vy8wBYTg96O9w3JMPOMQhGE8l
         0HgCNkH6cCW43i9YqnYzynUmqsIDIrJC3xojFoo9HrlWpDKPlKZvkFEdM+x9wwqPwZe3
         wCfh9LhnyZJC99kQVJx2USymrOWQJFQBga5CDn+pqgQtucAIOM26yBrmp4LojWlntK+2
         jV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791136935; x=1791741735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxl6gThguTjmryCDwAa1VxSTqh72eFueCyhgsTktke8=;
        b=CiA136Z9DgNsv4CTRtl92GBLL1HTPT7Ll0JU2CFSpWoV2clxbHbPdp8yntnk/VrLZR
         1X+UZ5+PcCaeCORZcgQZxP5opjrPmP1yOkYrrx+WTf+5GEuA/YgeiITU0X3TJsy7k9ZI
         3RQ9Hs8LjfiWY+syT1e9deshcDLsf7Phwjiz4PJJvrTHpeWsP395YCPkAUuWuVx0CY7i
         axhteq+w6QNTjB8vNzbm+8Ua1Vz/Deibjigq19qXIprOFvIEE6YLXpvHQ9gQimEisGjc
         qVHc8ymd0+KuWAB11C5Vw/ETnTQzzS3Eovq/qSt8FZUrY3vQKRIt80rEtainOn4qQQzu
         Evhg==
X-Forwarded-Encrypted: i=1; AKwUvBz0AHiPp7B4MqxkKTGVYfQ+SHgdOX7FW0ucLdZtp7dj628h9R/vB9JHSwBagSP7p+uNU7bP7ZIyPdo=@lists.infradead.org
X-Gm-Message-State: AFuF++lfco/TgOVlShBgtrYOilkxNal3F99NfGWu5RIuup6JtkfpN1Yd
	igXrsmLAytKpusztt4IgAkNJLbsaVkgwiBtCiqnvW1yL2nFyGSk2hN9d25CoO3CKydfKlXh0MPg
	P/vKzJFaDNuhn2J6VlFwQ3TgI+jfPa5KqBoWE2hAD
X-Gm-Gg: AYBFou2pyQ6XQ3aknFjY49pWBDWOw/vcCSJfNKsdhPDjmujcosd62+5zIIV6aGvLqnx
	NUGXZpSi/nKkhgv711ZujlP2jtcASSTgsbkZ5fvuLkqk9sHa7/A+tFKNLT6T0K6gYuVi0FxsAEp
	31Jm90GzpulWJVXBBP8BuFzv7RSVDaw5auJFKRApvtrTIItCjq3ndmhEX1W26vQvJzLE2qsOMa5
	QtBT0uy6wcnYZf+1bCMcNwao0Hdlr8nQbRZ3WlSmJiX/c1/WrYGtSBDFpnOGG1rFzf9aV6GRy80
	w6ZYMsdXAkvX6lhGU9K2xUoXhN3GfNQ9F2jbrgVLQ3Z/JbpZWDxuXeAD
X-Received: by 2002:a05:622a:1b20:b0:530:e335:4ef with SMTP id
 d75a77b69052e-535113c3cb6mr18023261cf.2.1791136934142; Sun, 04 Oct 2026
 11:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-18-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-18-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 11:02:02 -0700
X-Gm-Features: AclHuK_nOqMX3djeZOdNLjNPymjaWdesvnL51eoG4SJjNhtYox1cB5x1yziRAMs
Message-ID: <CAJuCfpHiaV6uDCfOMmHJ4tPosUBPRMUF9zjrB0fkCWZG1umG5w@mail.gmail.com>
Subject: Re: [PATCH v4 18/38] fbdev: defio: assert FBINFO_VIRTFB, drop VM_IO,
 add VM_MIXEDMAP
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_110216_994115_5E8904E8 
X-CRM114-Status: GOOD (  24.69  )
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

T24gU2F0LCBPY3QgMywgMjAyNiBhdCA2OjM54oCvUE0gTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBDdXJyZW50bHkgYWxsIGRyaXZlcnMgd2hpY2ggdXNl
IGRlZmlvIGFsbG9jYXRlIHN5c3RlbSBtZW1vcnkuIEFsbCBvZiB0aGVtCj4gYWxzbyBzZXQgRkJJ
TkZPX1ZJUlRGQiwgb3RoZXIgdGhhbiBzc2QxMzA3ZmIsIGhvd2V2ZXIgdGhpcyBkcml2ZXIgYWxs
b2NhdGVzCj4gc3lzdGVtIFJBTSwgc28gc2ltcGx5IGZhaWxlZCB0byBzZXQgdGhpcyBmbGFnIHdo
ZW4gaXQgb3VnaHQgdG8uCj4KPiBUaGlzIHBhdGNoIHNldHMgRkJJTkZPX1ZJUlRGQiBvbiBzc2Qx
MzA3ZmIgcHJvYmUsIHRoZW4gZHJvcHMgc2V0dGluZyBWTV9JTwo+IGluIGZiX2RlZmVycmVkX2lv
X21tYXAoKSBhbmQgaW5zdGVhZCByZXF1aXJlcyBGQklORk9fVklSVEZCIHRvIGJlIHNldCwKPiBl
cnJvcmluZyBvdXQgd2l0aCBhIGtlcm5lbCB3YXJuaW5nIGlmIG5vdC4KPgo+IFRoZSBsb2dpYyBy
ZXF1aXJlcyBhIHBhZ2UgZnJvbSB0aGUgZHJpdmVyIGFuZCBzaW5jZSBjb21taXQgMWVjYmM3ZGQy
OTAyCj4gKCJmYmRldi9kZWZlcnJlZC1pbzogQWx3YXlzIGNhbGwgZ2V0X3BhZ2UoKSBmb3IgZnJh
bWVidWZmZXIgcGFnZXMiKSBoYXMKPiBhbHdheXMgcmVxdWlyZWQgaXQgdG8gYmUgcmVmY291bnRl
ZCwgc28gdGhpcyB3YXMgaW1wbGljaXRseSBhbHJlYWR5IHRoZQo+IGNhc2UuCj4KPiBGaW5hbGx5
IHRoaXMgcGF0Y2ggc2V0cyBWTV9NSVhFRE1BUCwgYXMgdGhlIGxvZ2ljIGlzIG1hcHBpbmcKPiBr
ZXJuZWwtYWxsb2NhdGVkIG1lbW9yeSBzbyB0aGlzIGlzIGFwcHJvcHJpYXRlLgo+Cj4gUmV2aWV3
ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IFNpZ25lZC1v
ZmYtYnk6IExvcmVuem8gU3RvYWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5vcmc+CgpXaXRoIHRoZSBz
YW1lIGRpc2NsYWltZXIgYXMgaW4gcHJldmlvdXMgcGF0Y2gsCgpSZXZpZXdlZC1ieTogU3VyZW4g
QmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KCgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L2NvcmUvZmJfZGVmaW8uYyB8IDYgKysrLS0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYv
c3NkMTMwN2ZiLmMgICAgIHwgMiArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2Nv
cmUvZmJfZGVmaW8uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jCj4gaW5k
ZXggZmQwMGI4NmUxYWU2Li5mYjM1OWVjYzM5NjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRl
by9mYmRldi9jb3JlL2ZiX2RlZmlvLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUv
ZmJfZGVmaW8uYwo+IEBAIC0zNjYsMTMgKzM2NiwxMyBAQCBpbnQgZmJfZGVmZXJyZWRfaW9fbW1h
cChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gIHsK
PiAgICAgICAgIHZtYS0+dm1fcGFnZV9wcm90ID0gcGdwcm90X2RlY3J5cHRlZCh2bWEtPnZtX3Bh
Z2VfcHJvdCk7Cj4KPiArICAgICAgIGlmIChXQVJOX09OX09OQ0UoIShpbmZvLT5mbGFncyAmIEZC
SU5GT19WSVJURkIpKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gICAgICAg
ICBpZiAoIXRyeV9tb2R1bGVfZ2V0KFRISVNfTU9EVUxFKSkKPiAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4KPiAgICAgICAgIHZtYS0+dm1fb3BzID0gJmZiX2RlZmVycmVkX2lvX3Zt
X29wczsKPiAtICAgICAgIHZtX2ZsYWdzX3NldCh2bWEsIFZNX0RPTlRFWFBBTkQgfCBWTV9ET05U
RFVNUCk7Cj4gLSAgICAgICBpZiAoIShpbmZvLT5mbGFncyAmIEZCSU5GT19WSVJURkIpKQo+IC0g
ICAgICAgICAgICAgICB2bV9mbGFnc19zZXQodm1hLCBWTV9JTyk7Cj4gKyAgICAgICB2bV9mbGFn
c19zZXQodm1hLCBWTV9NSVhFRE1BUCB8IFZNX0RPTlRFWFBBTkQgfCBWTV9ET05URFVNUCk7Cj4g
ICAgICAgICB2bWEtPnZtX3ByaXZhdGVfZGF0YSA9IGluZm8tPmZiZGVmaW9fc3RhdGU7Cj4KPiAg
ICAgICAgIGZiX2RlZmVycmVkX2lvX3N0YXRlX2dldChpbmZvLT5mYmRlZmlvX3N0YXRlKTsgLyog
cmVsZWFzZWQgaW4gdm1hLT52bV9vcHMtPmNsb3NlKCkgKi8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9mYmRldi9zc2QxMzA3ZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvc3NkMTMwN2Zi
LmMKPiBpbmRleCBjNGZkZWNhZmQ4NTYuLjk1ODUxNGEzNTQzMyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L3NzZDEzMDdmYi5jCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9z
c2QxMzA3ZmIuYwo+IEBAIC03NjMsNiArNzYzLDggQEAgc3RhdGljIGludCBzc2QxMzA3ZmJfcHJv
YmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKPiAgICAgICAgIGluZm8tPmZpeC5zbWVtX3N0
YXJ0ID0gX19wYSh2bWVtKTsKPiAgICAgICAgIGluZm8tPmZpeC5zbWVtX2xlbiA9IHZtZW1fc2l6
ZTsKPgo+ICsgICAgICAgaW5mby0+ZmxhZ3MgPSBGQklORk9fVklSVEZCOwo+ICsKPiAgICAgICAg
IGZiX2RlZmVycmVkX2lvX2luaXQoaW5mbyk7Cj4KPiAgICAgICAgIGkyY19zZXRfY2xpZW50ZGF0
YShjbGllbnQsIGluZm8pOwo+Cj4gLS0KPiAyLjU1LjAKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5n
IGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
