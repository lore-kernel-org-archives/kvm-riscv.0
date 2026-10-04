Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA83CA5FF1
	for <kvm-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 18:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LaYkN8KNrUdbpvoc/8d5IHvCMKop0zKT7B+5hPY8PFw=; b=yxoAJzhD0MnY5y
	IwQS1cz3zHcv0wovind3Xex/jXi+co6wJpeF2qkKd3MJXyyswH8r1vHzFjgLTANz/mmipPwVHiaEJ
	al7xHVucni700w2mkTdZdPfiLn8HqZmNJVCAfDkab1h7E6uEOsJ7odeckURJzkP52CL8U6m7+vSRf
	pUb0MPlH69046uhS63P4vz8HmWfZtwvm+kWLuTZXvalDMFHj8uaoLSdv98Ws1JEAlJ3RZ4/KvdHeV
	Rsw6MSgBmhboMNs8fkr28W+A604eXq6/s7fWYaxTbo3+yDCCSQUmkyiDUDlPHb6LrxnZHa8hdiYTj
	XqxELzWMZ+FMwPlaDVBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQss-0000000FAAP-0t36;
	Sun, 04 Oct 2026 18:24:27 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQsn-0000000FA8o-3hRH
	for kvm-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 18:24:24 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6aae147ef9dso7768a12.0
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Oct 2026 11:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791138259; cv=none;
        d=google.com; s=arc-20260327;
        b=I9aovl7ae4O9GdQ59xb2bUWaqQU7mIthWWJPHP4+ABRquxHdQfwX5U4lXEtEOjKk7F
         GZ9QiqMmI5ZqOBlcM1WAsV1qIwhfZNRAO5+uzzfg3O1s9vxmTVDZxW3Q7U7ugceO+Rwr
         LPENeUYekAW1r0ygHReaIzMMFbspceKRTx7BwVE/uWt71oxTXuO3pxwLDzJv0o8ELtpc
         /Ap66vgtz20/Fdo+JDabMITuE7IBHhHHnnszpnDdnftY+C9Tsq3MkNggYw16zfue7nyA
         bTtMxpWKNN945IiI28AQyNVGr7kss6I+CQvJtaFR1WVCZbN8umZEMDtnAK8/6NUcXoaK
         n8cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=COuPsBcUBk1eT8Q71dO8QdpqB3ZPgP0C77xCCCNJQiA=;
        fh=5SNlmpnIuvvd4fKfVLPsnU+FWKZG6XaZcJQa4L+BrPA=;
        b=YoE4UTqhR8NXszMNuCmn9AFFloX5MXknmwaKmDksDcLQLBvGwpI++dN+9W9M2ej7uk
         4s+Bsn+uRVa7RS34Mwii8UoEFVYdIedqPTIh5UAPtqs6wcBjFz4LlD6k8jMtTitwF6dX
         Dz1bMk9D6EZLinz4OWc8bYXtyk3YVqYyW0ldSNJULrzUBHWVRmB+KIIlMSJIcVKE80E4
         5VaYx3oH2xjupgdKHqREDqojby5Y+V+VZ8KQyV4gsmfKLpdRjohEaSLsTgjlYbxKR6Fi
         dtT4dpT78D8xjKXac10ePzajeX4FykZePVRwJTG1pJqrjYTqoTi/gv/cNr3hxw13U1za
         8POA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791138259; x=1791743059; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=COuPsBcUBk1eT8Q71dO8QdpqB3ZPgP0C77xCCCNJQiA=;
        b=wSz08z3//s5+WUibasZVHaKMbzOYJsqSWLzMG+75w4GM11prgFwwI+oRkAqF3SOsuD
         sB410bY/FmoxvmCyP3g7rx+Il8sOEubUdoTVmz3Brzh93g6KzUp1taL9Kl+C3zml+aGg
         MFd8K1Aj/U56zKcAL77mhaha/aI79sjT1efC7DmmzsVHTOAhiy+Gr7qCozzqJk+xInbA
         ix6Zaw1lbunuy2fAcozSMpN2o1i2TYrR2V2lC36SnwAwPbVuAmglbmxIE4ehtGNierSR
         9IiTXMsKn+0Z9Gf8cgOnpuneqd42uSMHJqMlLIMoqLtoPFb39HVhq/hnEiB6IUpELjoe
         JcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791138259; x=1791743059;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COuPsBcUBk1eT8Q71dO8QdpqB3ZPgP0C77xCCCNJQiA=;
        b=rfAknfCM47aG9mAPg9oGOmVcvw/0iNONYfGKfmKynZUh32uWu+gFnqVUrm2+Bzn1WE
         fBdHSqelfcFQysaVSrTanvI3rrZaoUritmUCx6cloUCQIbE8mwrTgAZxaOJ4rzr+Ipvh
         on+8BHoEDQdcnTOYiDrhMrCF/VaTOy/RL38ITy/s0xeDakayQkmYbswgEFHTiubOTOee
         mXUNDrCj6Yv8Sevn33ucRZzflzI5kF7b9QZ3FX5i+o4YJusTIlzQQ+DcWGch3Pj8GcXr
         8ayRQF8Ijb2WHozx6RAuCWIGflJGC0f4ezm7QSV4w+OTKZeuo4StYzxMP6bfZoa6v3Vc
         ICWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxk8MGwvHKuCsQ+eFNDp8t1vqfBiDpgQ1l1CeE0lxfZMbxj7vfX4f86R08bhWxIIhJZELsCXDzBME=@lists.infradead.org
X-Gm-Message-State: AFq9FYJQMKIyX2H4kd23Jxyj7Ejp6RM6hPckG0ED7tjsfFIyaLhC63mN
	P84NxNX/WGbvjFbVshtZ90WHh6sGnAu4dNJXQBo9P1wJtX5Kfg5uH1kao1YzYLwkoPCf2lZ5GnZ
	/45I11CoXhwfUKgKXEMpz7ttRJbPOQo0eWmxXQzDb
X-Gm-Gg: AYBFou1IkVichy82Q6xe9qa4/NyTpncnkZlV/Uddz8w4SwjU0PlHgwqkN6y1sgcrK/j
	Sa22mPyyJhGuSnPGKOa+gf47oK2aX5M5ws7GZ98KJFbqIaYaVaKPURHeLnZYBfOYxiFiAZ6Tlwx
	PtgcksRXLg+QLVp2PqKlw8onBWZVpuKpwf7aNGfAwBA0uoUyDbJDEpdODoSfc33hd4RVt9gAJf2
	hLXTfccKebteImo2ssHjPlxbneqPVxAt8RSlw9HJTijrErtVevtldvjbCn66Q7K+esPuWc8Mbry
	a9z8Rx7s86R2AAzeYvRr4kCiRssTM1zJwMuaTDQrav7NP5WQZjWVnwoynQgOJDmEniI=
X-Received: by 2002:a05:6402:a2cb:10b0:6af:7a5a:97e4 with SMTP id
 4fb4d7f45d1cf-6afaf6bf03amr34523a12.12.1791138257648; Sun, 04 Oct 2026
 11:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-20-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-20-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 11:24:03 -0700
X-Gm-Features: AclHuK9H1gPgFkK4n-5s4Gd8NQjwfuvbGlNRYoPrM6gC5ICSAC1H3Sf5qTdT1bA
Message-ID: <CAJuCfpHOo8UhAZMvO5A3dKbqxQGAWtKGMHXJ+Fc=qwH=Nm0b6w@mail.gmail.com>
Subject: Re: [PATCH v4 20/38] mm/gup: error out early on !VMA_MAYREAD_BIT VMAs
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_112421_984308_CBED3265 
X-CRM114-Status: GOOD (  22.01  )
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

T24gU2F0LCBPY3QgMywgMjAyNiBhdCA2OjQw4oCvUE0gTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBXaGVuIHBvcHVsYXRpbmcgYSBWTUEgcmFuZ2Ugdmlh
IHRoZSBhcHRseSBuYW1lZCBwb3B1bGF0ZV92bWFfcGFnZV9yYW5nZSgpCj4gYW4gdW5yZWFkYWJs
ZSBWTUEgd2lsbCBhbHdheXMgZXZlbnR1YWxseSBmYWlsIHdpdGggLUVGQVVMVC4KPgo+IFRoYXQg
YSBWTUEgaXMgYWNjZXNzaWJsZSBpcyBhbHdheXMgY2hlY2tlZCwgaG93ZXZlciBWTUFfTUFZUkVB
RF9CSVQgaXMgbm90Lgo+Cj4gQWxsIHVzZXIgbWFwcGluZ3MgYWx3YXlzIGhhdmUgVk1BX01BWVJF
QURfQklUIHNldCwgc28gdGhpcyBjaGVjayBvbmx5Cj4gaW1wYWN0cyBrZXJuZWwgbWFwcGluZ3Mu
Cj4KPiBJdCBpcyBpbXBsZW1lbnRlZCBzcGVjaWZpY2FsbHkgdG8gZGlzYWxsb3cgcG9wdWxhdGlv
biBvZiB1cHJvYmVzIFhPTAo+IG1hcHBpbmdzIHdoaWNoIGFyZSBleGVjLW9ubHkuCj4KPiBBIG5h
c3R5IGludGVyYWN0aW9uIHdpdGggdGhlc2UgbWFwcGluZ3MgbWF5IG9jY3VyIGlmIHRoZXkgYXJl
IG1sb2NrZWQsIHNvCj4gYWN0aXZlbHkgZGlzYWxsb3cgdGhpcyBlYXJseS4KPgo+IFRoaXMgYWxs
b3dzIGEgc3Vic2VxdWVudCBjb21taXQgdG8gcmVtb3ZlIHRoZSBWTV9JTyBjaGVjayBpbgo+IF9f
bW1fcG9wdWxhdGUoKSB3aGljaCBvdGhlcndpc2UgcmVxdWlyZXMgbm9uLU1NSU8gbWFwcGluZ3Mg
dG8gYmUgd3JvbmdseQo+IGZsYWdnZWQgc2ltcGx5IGFzIGEgd29ya2Fyb3VuZC4KPgo+IEFja2Vk
LWJ5OiBaaSBZYW4gPHppeUBudmlkaWEuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gU3Rv
YWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5vcmc+CgpSZXZpZXdlZC1ieTogU3VyZW4gQmFnaGRhc2Fy
eWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KCgo+IC0tLQo+ICBtbS9ndXAuYyB8IDQgKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvbW0vZ3VwLmMg
Yi9tbS9ndXAuYwo+IGluZGV4IGMyZGZjYjQ3NDRiYy4uZTYzMTBhN2NjMDViIDEwMDY0NAo+IC0t
LSBhL21tL2d1cC5jCj4gKysrIGIvbW0vZ3VwLmMKPiBAQCAtMTgzNiw2ICsxODM2LDEwIEBAIGxv
bmcgcG9wdWxhdGVfdm1hX3BhZ2VfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4g
ICAgICAgICBpZiAoIXZtYV9pc19hY2Nlc3NpYmxlKHZtYSkpCj4gICAgICAgICAgICAgICAgIHJl
dHVybiAtRUZBVUxUOwo+Cj4gKyAgICAgICAvKiBVbnJlYWRhYmxlIFZNQXMgYWxzbyBjYW5ub3Qg
YmUgZmF1bHRlZCBpbi4gKi8KPiArICAgICAgIGlmICghdm1hX3Rlc3Qodm1hLCBWTUFfTUFZUkVB
RF9CSVQpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsKPiArCj4gICAgICAgICBn
dXBfZmxhZ3MgPSBGT0xMX1RPVUNIOwo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIFdlIHdhbnQg
dG8gdG91Y2ggd3JpdGFibGUgbWFwcGluZ3Mgd2l0aCBhIHdyaXRlIGZhdWx0IGluIG9yZGVyCj4K
PiAtLQo+IDIuNTUuMAo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgo=
