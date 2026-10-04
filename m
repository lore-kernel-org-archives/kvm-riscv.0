Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF981CA5FE6
	for <kvm-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 17:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B8/q3mD2O+alHM6+txINWGijV4TjWdCXMUJ3vPyGB1Y=; b=sIp2UtxfOR9Vl6
	dsCKWsWLhvBIs0GAjreyQte0KzIoM8CB3IhP9zNM6hYJk84JTXoEa8PkCjb0/rkxT+nSLzxlPrMU6
	OBCdPPjXFXqN4dTK2OHLW5SFCpkznXBr/PdiBO9ueyazY1MofW5m9i+MekY0fyvZIRa2tDKYxfe0R
	0zs5j5/bhcbPkyT4tBw0K0kW5SzB0ub7Jq5gp+2rignmv++RcZK0xlNT8pIPxB81e0qEU4X8uNSs8
	i8D96/WBLWnrwym1DoLEo9VJgBD9a2zdzafH/FHLULuzdbKRRZGcSyZr4gpjJkKSxg2JRFWs8MCAe
	b4c+HNo5YfE1yR6ZLOgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQFK-0000000F8N9-2cY6;
	Sun, 04 Oct 2026 17:43:34 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQFI-0000000F8MD-1j09
	for kvm-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 17:43:33 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-5351f9dbfe0so96221cf.1
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Oct 2026 10:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791135811; cv=none;
        d=google.com; s=arc-20260327;
        b=hS6KTGhOhBX7HQ2PArBuLUowSf0icKxB5fr17YznotEaExQsSvkf2LumruNrOT8Vgp
         UXZDV4zj9YC0tjdRB3x+kAuWXXi3ooSbi9lhRibXz1SCV8CjSp2G6gHMTCAhdbZZd4Cb
         /l7ww+czZYMuEDA+nvhxIel20v7Heg4vdH7JNE0o+5HsHWZC1XuRlLBt1zevSaLNU7xP
         sarJFpJLrHd2XhiQifmmHmttlQp8/QkZUHkAkqs0TV5f/xvc1WuL8GwsCzvgh+4oHR3Q
         luvXq/CoXMrCl8zBtdi4sxwajpkaX+vucjrEGQsbjaOiO/KZwROpFWnsOl7WMOr5oAFp
         cAvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vMNQ59LV7QrrLF0PW8JXbsDZwLj1dza/KEaeRbY4SzE=;
        fh=GYnrPIis1E7xFuhqUw+yAEs10NFClSMTMCV3AG0GAFQ=;
        b=ggd0xfYM9q9tnzakbuNOErcTP3TfwW9um/LYdtE1y1mpqOpPz/aJ2/nQJ7sgwTmHNj
         fTrtsXYHaC9o0XeN42YfkHMvByzJWt04yiTTyXKGYhR4O8VJnDern40QwxyEO9YHADne
         z7lg/PNvvip8UK692KJrv6IIF7PjSAqsu6cuoH9jdOsfK31crg4oYqe8FFiOMBbbpUhm
         ls4ljgpQdhx8y9vSMnry0a/g9ipFYgxKxM5CgX1xcNp3O/IcU0JYzdUzPGdYM6u6Mw1G
         VuMzGcaeSP3sy7cSDxVOPd5q6CaTdeC2jHI2/7ExNxMpdlaDK3dm7yvE0x/9pukQO1Il
         0BeQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791135811; x=1791740611; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vMNQ59LV7QrrLF0PW8JXbsDZwLj1dza/KEaeRbY4SzE=;
        b=KmzBQW14DGQvEehiGH9Oj1/ShLpMF8lzhR+e/KVA2EOp4AWFYg6OYddhgpYvnQQkKx
         VwulBIz0S7/nziotIYG9RYYkz7e9Of7fY7eNm+peMg1iVyQLF8DHyF0S6zt0UtFu8eUU
         01RR8Wje5tmsYYXwp09mybaOonK+cxqIivc2mUhUzp2EG7zqHeYO6Kt4OLONuHrwuwuc
         ycBw5VopptCR3PjytHdy53NXkarIS1QXwhCw+kHqzpZqkNC44ze87aBDottlHZpzFS+C
         RGUV3TxlXgcvcSgVhuELnqExufr+e1Wf4zT9XHsCXuDTck2C+Jg9suSA4N77BJuucC50
         M9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791135811; x=1791740611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vMNQ59LV7QrrLF0PW8JXbsDZwLj1dza/KEaeRbY4SzE=;
        b=aegcv4y3rlBEufCc13akISJBwAfAqLS5Ia/vRerjsKM5qyAdq7OSG7if3DN3Qzqlfg
         DYakYVlCBu8XqzW1lft2EQ/kIDyGJG4Co+r+HoPEpA/Yf5s6qRFbWbbL+OKdNnUAstNy
         A8yDr6OcSfuZC92ok3ysFahfxKicvCy5J9bRXR1JUBC31kh7I4qlJSzZ5inkMyFijtqt
         omImVnOr8TQmDHwuNV69pdONO+BJZyKthvmKebrNgKqxo5ENTez8kCXnjaEukin0c1KT
         h+K3559nWVn8Wdgg3tkuRHsikL/Xk/etqzKQFEzDFk0iAZYD+EOrtTCLkX2HcEePKEti
         6E6g==
X-Forwarded-Encrypted: i=1; AKwUvBw7zD9TgJWwIHmco2NT0ADwv+dGfgZ1vLOhA7SwrwFBI6P0a4a+QOu/dy6wvpnJnT8eJHQlbH/13FQ=@lists.infradead.org
X-Gm-Message-State: AFuF++lh/xhxV5iWEXyf8WRLlukXNewDSDpXonuzRfyZKZnIIV+2UVXU
	YqzxSybo411kf27xvMvNNKqYdZGsL96gd1HzayUjnR4TISU+x3U39Gp0WdqqlClr1Pqf7Dh5TJi
	HVAfqNjiHKEye8h5LbN3Aiuv6sqpRlZslZxmPlOsS
X-Gm-Gg: AYBFou0D44hFQS/xkByf1xjhV0L8Pi07yDwwHv6bdrT8ePDgIIyCz54taAFuHV8w0Tu
	RUBiaTloLZGV+JtNA2sUiQoouwkNP+CSGcIHjVTUH4jy2Z0cBZcM4kEhZwRcAXz8pVPT+28O39C
	MI4VXM/3miaa55wB1PLhFvbLWpJqW723Htc891u+v2g64jERg+sbQ9geCGpevPFvYEh5P8KDXr5
	47/buBQ4oV42GaS1sxhIpMHTMgkyq+EyTDqoHk5+swSvq2TkaSZc73YZrshGguCZjboMKYPGdIk
	YilKFrmLTgDuIOOhuS21RA5rC4acNq2hC4lfSL/Yz7bwnFMRbPxoH+K7
X-Received: by 2002:a05:622a:5c09:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-5351497bae9mr16844861cf.14.1791135809929; Sun, 04 Oct 2026
 10:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-14-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-14-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 10:43:17 -0700
X-Gm-Features: AclHuK-Z2ieyqrFQLh5f1D20FCqfsVRqEWMyJIzhNXdOxd9iUhJDwyyLAY8lrcs
Message-ID: <CAJuCfpFounkD97p9iJ8zUunAMoOv+h8Tnxf2NOkp7qs3cfqs7w@mail.gmail.com>
Subject: Re: [PATCH v4 14/38] mm/vma: add vma[_flags]_is_mm_managed() predicates
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_104332_506103_5344A0CD 
X-CRM114-Status: GOOD (  32.89  )
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

T24gU2F0LCBPY3QgMywgMjAyNiBhdCA2OjM44oCvUE0gTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBSYXRoZXIgdGhhbiByZWZlcnJpbmcgdG8gVk1BIGZs
YWdzIHdpdGggdW5jZXJ0YWluIG1lYW5pbmcsIGFkZCBhIG5ldwo+IHByZWRpY2F0ZSB0aGF0IGV4
cGxpY2l0bHkgZGVzY3JpYmVzIHdoYXQgYWJzZW5jZSBvZiB0aGUgVk1BX1BGTk1BUF9CSVQgYW5k
Cj4gVk1BX01JWEVETUFQX0JJVCBmbGFncyBtZWFucywgYW5kIHRoZW4gcmVmZXIgdG8gdGhhdCBm
dW5jdGlvbiBmb3IKPiBkZXRlcm1pbmluZyBWTUEgbWVyZ2VhYmlsaXR5Lgo+Cj4gSWYgbmVpdGhl
ciBvZiB0aGVzZSBmbGFncyBhcmUgc2V0LCB0aGF0IG1lYW5zIHRoZSBjb250ZW50cyBvZiB0aGUg
bWFwcGluZwo+IGFyZSBtYW5hZ2VkIGJ5IGNvcmUgbW0uCj4KPiBPdGhlcndpc2UgdGhleSBhcmUg
aW5zdGVhZCBvd25lZCBieSBzb21lIG90aGVyIGtlcm5lbCBjb21wb25lbnQsIHVzdWFsbHkgYQo+
IGRyaXZlcjogdGhlIG1lbW9yeSBtYXkgYmUgTU1JTywga2VybmVsLWFsbG9jYXRlZCBwYWdlcyBv
ciBldmVuIG9yZGluYXJ5Cj4gcGFnZXMgdGhlIGRyaXZlciBtYXBzIGl0c2VsZiwgYnV0IGNvcmUg
bW0gbXVzdCBub3QgcG9wdWxhdGUsIHJlY2xhaW0sCj4gbWlncmF0ZSwgY29weS1vbi13cml0ZSBv
ciBtZXJnZSB0aGUgcmFuZ2UgaXRzZWxmLgo+Cj4gV2UgaW5pdGlhbGx5IGFsc28gdHJlYXQgVk1B
X0lPX0JJVCBhcyBpbXBseWluZyBhIG1hcHBpbmcgaXMgbm90IG1tLW1hbmFnZWQsCj4gYXMgYnkg
aW1wbGljYXRpb24gaXQgY2Fubm90IGJlLiAobWxvY2soKSBhbHNvIHNldHMgVk1BX0lPX0JJVCB0
cmFuc2llbnRseQo+IG9uIG9yZGluYXJ5IFZNQXMgd2hpbGUgbG9ja2luZyB0aGVtLCB3aGljaCBp
cyBhZGRyZXNzZWQgbGF0ZXIgaW4gdGhpcwo+IHNlcmllcy4pCj4KPiBIb3dldmVyIHRoZSBpbnRl
bnQgaXMgdG8gaW4gZnV0dXJlIHJlbW92ZSB0aGlzLCBhcyBubyBtYXBwaW5nIHNob3VsZCBiZQo+
IG1hcmtlZCBhcyBhbiBJL08gbWFwcGluZyB3aXRob3V0IGFsc28gYmVpbmcgbWFya2VkIHdpdGgg
Vk1BX1BGTk1BUF9CSVQuCj4KPiBUaGlzIGZvcm1zIHRoZSBiYXNpcyBvZiBmdXJ0aGVyIHdvcmsg
aW50ZW5kZWQgdG8gaW1wcm92ZSBob3cgd2UgZXhwcmVzcyBWTUEKPiBwcm9wZXJ0aWVzIHN1Y2gg
YXMgdGhpcy4KPgo+IEFsc28gdXBkYXRlIHRoZSBWTUEgdXNlcmxhbmQgdGVzdHMgdG8gcmVmbGVj
dCB0aGUgY2hhbmdlLgo+Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4KPiBSZXZp
ZXdlZC1ieTogWmkgWWFuIDx6aXlAbnZpZGlhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMb3Jlbnpv
IFN0b2FrZXMgKEFSTSkgPGxqc0BrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IFN1cmVuIEJhZ2hk
YXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+CgoKPiAtLS0KPiAgaW5jbHVkZS9saW51eC9tbS5o
ICAgICAgICAgICAgICB8IDUzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystCj4gIHRvb2xzL3Rlc3Rpbmcvdm1hL2luY2x1ZGUvZHVwLmggfCAyOSArKysrKysrKysrKysr
KysrKysrKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tLmggYi9pbmNsdWRlL2xpbnV4
L21tLmgKPiBpbmRleCA5N2UxZWI0ZmUzYTQuLjgzOTUzNzU3NzM1YSAxMDA2NDQKPiAtLS0gYS9p
bmNsdWRlL2xpbnV4L21tLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L21tLmgKPiBAQCAtMTYxMiw2
ICsxNjEyLDQxIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCB2bWFfaXNfc2hhcmVkX21heXdyaXRlKGNv
bnN0IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICAgICAgICAgcmV0dXJuIGlzX3NoYXJl
ZF9tYXl3cml0ZSgmdm1hLT5mbGFncyk7Cj4gIH0KPgo+ICsvKioKPiArICogdm1hX2ZsYWdzX2lz
X21tX21hbmFnZWQoKSAtIERvIHRoZSBzcGVjaWZpZWQgVk1BIGZsYWdzIGluZGljYXRlIHRoYXQg
dGhlCj4gKyAqIGNvbnRlbnRzIG9mIHRoZSBWTUEgYXJlIG1hbmFnZWQgYnkgY29yZSBtbT8KPiAr
ICogQGZsYWdzOiBUaGUgVk1BIGZsYWdzIHRvIHRlc3QuCj4gKyAqCj4gKyAqIFN1Y2ggYSBtYXBw
aW5nIGlzIG9uZSBlc3RhYmxpc2hlZCBieSBhIHNpbXBsZSBtbWFwKCkgb3IgYnJrKCkgd2l0aCBu
byBkcml2ZXIKPiArICogb3Igb3RoZXIga2VybmVsIGNvbXBvbmVudCBpbnZvbHZlZC4KPiArICoK
PiArICogVGhleSBhcmUgcm1hcHBhYmxlLCBhbmQgY29yZSBtbSBzZXJ2aWNlcyBybWFwIG9wZXJh
dGlvbnMgaW5jbHVkaW5nIHJlY2xhaW0sCj4gKyAqIGFzIHdlbGwgYXMgcG9wdWxhdGlvbiwgQ29X
IGFuZCBtZXJnZS9zcGxpdCAoaWYgZWxpZ2libGUpLgo+ICsgKgo+ICsgKiBNYXBwaW5ncyB3aGlj
aCBmYWlsIHRoaXMgdGVzdCBhcmUgdGhvc2Ugd2hlcmUgdGhpcyBpcyBub3QgdGhlIGNhc2UgLQo+
ICsgKiBlLmcuIE1NSU8sIHVzZXItbWFwcGVkIGtlcm5lbCBwYWdlcywgdWRtYWJ1ZiAocGZubWFw
IHNobWVtKSwgZXRjLgo+ICsgKgo+ICsgKiBSZXR1cm5zOiB0cnVlIGlmIHRoZSBmbGFncyBpbmRp
Y2F0ZSBhbiBtbS1tYW5hZ2VkIG1hcHBpbmcuCj4gKyAqLwo+ICtzdGF0aWMgaW5saW5lIGJvb2wg
dm1hX2ZsYWdzX2lzX21tX21hbmFnZWQoY29uc3Qgdm1hX2ZsYWdzX3QgKmZsYWdzKQo+ICt7Cj4g
KyAgICAgICByZXR1cm4gIXZtYV9mbGFnc190ZXN0X2FueShmbGFncywgVk1BX1BGTk1BUF9CSVQs
IFZNQV9NSVhFRE1BUF9CSVQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBW
TUFfSU9fQklUKTsKPiArfQo+ICsKPiArLyoqCj4gKyAqIHZtYV9pc19tbV9tYW5hZ2VkKCkgLSBB
cmUgdGhlIGNvbnRlbnRzIG9mIEB2bWEgbWFuYWdlZCBieSBjb3JlIG1tPwo+ICsgKiBAdm1hOiBU
aGUgVk1BIHRvIHRlc3QuCj4gKyAqCj4gKyAqIFNlZSB2bWFfZmxhZ3NfaXNfbW1fbWFuYWdlZCgp
IGZvciBhIGRlc2NyaXB0aW9uIG9mIHRoaXMgcHJvcGVydHkuCj4gKyAqCj4gKyAqIFJldHVybnM6
IHRydWUgaWYgdGhlIFZNQSBpcyBtbS1tYW5hZ2VkLgo+ICsgKi8KPiArc3RhdGljIGlubGluZSBi
b29sIHZtYV9pc19tbV9tYW5hZ2VkKGNvbnN0IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+
ICt7Cj4gKyAgICAgICByZXR1cm4gdm1hX2ZsYWdzX2lzX21tX21hbmFnZWQoJnZtYS0+ZmxhZ3Mp
Owo+ICt9Cj4gKwo+ICAvKioKPiAgICogdm1hX2ZsYWdzX2Nhbl9tZXJnZSgpIC0gRG8gdGhlIHNw
ZWNpZmllZCBWTUEgZmxhZ3MgcGVybWl0IHRoZSBWTUEgdG8gYmUKPiAgICogbWVyZ2VkIHdpdGgg
YW5vdGhlcj8KPiBAQCAtMTYyMCw3ICsxNjU1LDIzIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCB2bWFf
aXNfc2hhcmVkX21heXdyaXRlKGNvbnN0IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICAg
Ki8KPiAgc3RhdGljIGlubGluZSBib29sIHZtYV9mbGFnc19jYW5fbWVyZ2UoY29uc3Qgdm1hX2Zs
YWdzX3QgKmZsYWdzKQo+ICB7Cj4gLSAgICAgICByZXR1cm4gIXZtYV9mbGFnc190ZXN0X2FueV9t
YXNrKGZsYWdzLCBWTUFfU1BFQ0lBTF9GTEFHUyk7Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICog
Vk1BIG1lcmdpbmcgYXNzdW1lcyB0aGF0IGEgVk1BJ3MgZmxhZ3MgYW5kIGZpZWxkcyBjb21wbGV0
ZWx5IGRlc2NyaWJlCj4gKyAgICAgICAgKiBpdHMgc3RhdGUuCj4gKyAgICAgICAgKgo+ICsgICAg
ICAgICogSG93ZXZlciwgbWFwcGluZ3Mgd2hpY2ggYXJlIG5vdCBtbS1tYW5hZ2VkIG1heSBoYXZl
IGVzdGFibGlzaGVkIHN0YXRlCj4gKyAgICAgICAgKiB1cG9uIG1hcHBpbmcgbm90IGVtYm9kaWVk
IGluIGFueSBhdHRyaWJ1dGUgb2YgdGhlIFZNQS4KPiArICAgICAgICAqCj4gKyAgICAgICAgKiBB
ZGRpdGlvbmFsbHksIHByaXZhdGUgKENvVykgUEZOIG1hcHMgZW5jb2RlIHRoZSBzb3VyY2UgUEZO
IG9mIHRoZQo+ICsgICAgICAgICogcmFuZ2UgaW4gdm1hLT52bV9wZ29mZiwgd2hpY2ggbWF5IG90
aGVyd2lzZSBjYXVzZSBzcHVyaW91cyBtZXJnZXMuCj4gKyAgICAgICAgKi8KPiArICAgICAgIGlm
ICghdm1hX2ZsYWdzX2lzX21tX21hbmFnZWQoZmxhZ3MpKQo+ICsgICAgICAgICAgICAgICByZXR1
cm4gZmFsc2U7Cj4gKyAgICAgICAvKiBWTUEgZXhwbGljaXRseSBtYXJrZWQgYXMgYmVpbmcgdW5t
ZXJnZWFibGUuICovCj4gKyAgICAgICBpZiAodm1hX2ZsYWdzX3Rlc3QoZmxhZ3MsIFZNQV9ET05U
RVhQQU5EX0JJVCkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiArCj4gKyAgICAg
ICByZXR1cm4gdHJ1ZTsKPiAgfQo+Cj4gIC8qKgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5n
L3ZtYS9pbmNsdWRlL2R1cC5oIGIvdG9vbHMvdGVzdGluZy92bWEvaW5jbHVkZS9kdXAuaAo+IGlu
ZGV4IGE2YThlNTNjNGIzOC4uODljNjQ1YTZhZDYwIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rp
bmcvdm1hL2luY2x1ZGUvZHVwLmgKPiArKysgYi90b29scy90ZXN0aW5nL3ZtYS9pbmNsdWRlL2R1
cC5oCj4gQEAgLTE2NjUsNyArMTY2NSwzNCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgZmlsZV9pc19k
ZXZfemVybyhjb25zdCBzdHJ1Y3QgZmlsZSAqZmlsZSkKPiAgICAgICAgIHJldHVybiBmaWxlICYm
IGZpbGUtPmZfb3AgPT0gJnplcm9fZm9wczsKPiAgfQo+Cj4gK3N0YXRpYyBpbmxpbmUgYm9vbCB2
bWFfZmxhZ3NfaXNfbW1fbWFuYWdlZChjb25zdCB2bWFfZmxhZ3NfdCAqZmxhZ3MpCj4gK3sKPiAr
ICAgICAgIHJldHVybiAhdm1hX2ZsYWdzX3Rlc3RfYW55KGZsYWdzLCBWTUFfUEZOTUFQX0JJVCwg
Vk1BX01JWEVETUFQX0JJVCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZN
QV9JT19CSVQpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIGJvb2wgdm1hX2lzX21tX21hbmFn
ZWQoY29uc3Qgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gK3sKPiArICAgICAgIHJldHVy
biB2bWFfZmxhZ3NfaXNfbW1fbWFuYWdlZCgmdm1hLT5mbGFncyk7Cj4gK30KPiArCj4gIHN0YXRp
YyBpbmxpbmUgYm9vbCB2bWFfZmxhZ3NfY2FuX21lcmdlKGNvbnN0IHZtYV9mbGFnc190ICpmbGFn
cykKPiAgewo+IC0gICAgICAgcmV0dXJuICF2bWFfZmxhZ3NfdGVzdF9hbnlfbWFzayhmbGFncywg
Vk1BX1NQRUNJQUxfRkxBR1MpOwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFZNQSBtZXJnaW5n
IGFzc3VtZXMgdGhhdCBhIFZNQSdzIGZsYWdzIGFuZCBmaWVsZHMgY29tcGxldGVseSBkZXNjcmli
ZQo+ICsgICAgICAgICogaXRzIHN0YXRlLgo+ICsgICAgICAgICoKPiArICAgICAgICAqIEhvd2V2
ZXIsIG1hcHBpbmdzIHdoaWNoIGFyZSBub3QgbW0tbWFuYWdlZCBtYXkgaGF2ZSBlc3RhYmxpc2hl
ZCBzdGF0ZQo+ICsgICAgICAgICogdXBvbiBtYXBwaW5nIG5vdCBlbWJvZGllZCBpbiBhbnkgYXR0
cmlidXRlIG9mIHRoZSBWTUEuCj4gKyAgICAgICAgKgo+ICsgICAgICAgICogQWRkaXRpb25hbGx5
LCBwcml2YXRlIChDb1cpIFBGTiBtYXBzIGVuY29kZSB0aGUgc291cmNlIFBGTiBvZiB0aGUKPiAr
ICAgICAgICAqIHJhbmdlIGluIHZtYS0+dm1fcGdvZmYsIHdoaWNoIG1heSBvdGhlcndpc2UgY2F1
c2Ugc3B1cmlvdXMgbWVyZ2VzLgo+ICsgICAgICAgICovCj4gKyAgICAgICBpZiAoIXZtYV9mbGFn
c19pc19tbV9tYW5hZ2VkKGZsYWdzKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+
ICsgICAgICAgLyogVk1BIGV4cGxpY2l0bHkgbWFya2VkIGFzIGJlaW5nIHVubWVyZ2VhYmxlLiAq
Lwo+ICsgICAgICAgaWYgKHZtYV9mbGFnc190ZXN0KGZsYWdzLCBWTUFfRE9OVEVYUEFORF9CSVQp
KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKwo+ICsgICAgICAgcmV0dXJuIHRy
dWU7Cj4gIH0KPgo+IC0tCj4gMi41NS4wCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
