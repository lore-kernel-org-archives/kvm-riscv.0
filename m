Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CA7CA5FF6
	for <kvm-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 17:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uSIjNdTSN+ZIWzTI9H1QNjee8tYHGEM262trL0FQYHQ=; b=pnQ/U3g0BGASRu
	1ucjbUP1VEoQ2erjDH8sx3e0yL9RSy2C784/Up52u4J55HJdmatQdU6mZqgAU5z5Ny44CxVARCFaQ
	f5ZmdE7zP4D9B1jcV+7yeS8RXqeicRZWhGRx+pAl98RrW5BjtNnGWUjDbX2l0VEFmiCXFm4wiAHox
	/kfIvQW7AGC+cW7WxoSGnTiq67pijXci+5d1OQxHfLJs2ctdFyrMjINMjL6BpH+A5m8Df242tafiC
	4p+6b75JxuNMPPEJWQ1JNJ6igABUBltmW/UI3hjN91+IYwxo6kuZ1FXgqgvZExa0aVAKYOQsj8acS
	+NokPjff4mzuZmH0XVzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQQ9-0000000F90W-310e;
	Sun, 04 Oct 2026 17:54:45 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQQ4-0000000F8zH-3gjp
	for kvm-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 17:54:44 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-533202fe429so249201cf.0
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Oct 2026 10:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791136479; cv=none;
        d=google.com; s=arc-20260327;
        b=nvlFxsAo/QdbP2Rh9+dOOtOQ4hNDen8YNsdFHxXeaG4lUXWE9QFRsCaAISzBxNSeUx
         MC+Mo6jZahize5yyaUX7kOL4W+KzL2FJteMYGiBMWUbrM92l+bo3pVfj3e+W2+ftymCX
         Y/CktC8kk/jpCTEEjDzl9Vda8UQ+929YXj9uUjJ82x6tnfWl9v8Ie/nQCKyoB7pCDWCG
         dzRUHB1G1xOucLNrYpKMu2hsSO4ztMwOcu1B2SqItn159F/+2wzJo3VDqCxfH1uTxxNy
         6Q/oJ/sBplJXw14w9Ma3RwZgo5yM8JnqiFVoUqquHbjmMv4tDpGb2IIYnCBC4Jc0m3JL
         Ek4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fdcss6XzKw26cI5TyCzpDNu6o5ifWClMegsH9OJNnig=;
        fh=X3b9onyUPBXY+EU9VRoibLhtYMUYNlQkzPSp0sc+Gog=;
        b=fCRr/lUVDzAFNMQBr39NE69Ho/QRJ914T8KN98JcYpM8yq3b+UOeKYrpmhshML6aL6
         tP3ecQNMt5lw6wvZ38rUTV+IEHuJPalytTQG9Wd9I/EX59nIyxSdwv5h8ENOPEXc6/Qq
         X4Jlm+t5w13iw5vshV2AkA6X+OFofV/lZiUMrOH2C4wFv8oZnQGx3ycnwcILochbPnS7
         7Scb9GmiGcaGjNDkQfqgQRZHAWMFGGyXbOLv9nH7HtKwSCYkSCIzDHRqTcWZhhxhfE8I
         B4z2KupvCrk+7Pwc6ihKbdLmO+iylmBrOPEDslEXiNO+qJtuJvVyJxheL588nG//TQKe
         5GhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791136479; x=1791741279; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fdcss6XzKw26cI5TyCzpDNu6o5ifWClMegsH9OJNnig=;
        b=i0ulUDFAIqOP/HNmBf2mGRJh2N2YY2Sv6gyaadlbt9dVeOMXT/e9R1GMfC3Iht+ESq
         H/TWA3gWTP5cFVOrNnTeovc00b63BTGWFsRJJ/4Idr3DHr8AVFzrhGE7u8Rbn7agWPs+
         933E18bbFAa68MEiMPIOww46OJDTWvhjbEWd/gTAY7k7GKRccal32DD4LgN6bxACQ9+E
         aPx0Wwsi2E23zgFLb6gg/vn+x76T5j5NgtlLyXkoan8XgGpU+Jy66XH3LDxjTXIoKnNI
         L6uOJ7Lok2WiEL5Ao2plEZq9VyLeaF4KqeIcRveEgFiAsteihSNzaCvzdjTBkzp1ixg/
         y7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791136479; x=1791741279;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fdcss6XzKw26cI5TyCzpDNu6o5ifWClMegsH9OJNnig=;
        b=sIhVe6D7yiS7Ds2O/9knj4NbgrGRvBttvji0h6KlR9x6kxeywCO4MXYSJ9o4yMPeon
         mboJVIlyKxo8jbeG+0J5k0pgmWyRmNzNSnN0FrPfJ24WAbxzJ/wIh7QYOGd4gHVs0hfu
         8xc0r3ed+DKU6I2gkUO2PgNz2UCeMMWFmERZ2jD0QjLc6iUb/N+WRQwfOnKEuSmyaeUR
         n6TtFWEGjTJ4oLsOPn81m+jmtSAbLnDD06CN4rUVPmdMsPjppOR//0gtQERJRV5ATXqD
         NlCj/jQpucOnydLs9DIHQv07CbzHfdKiT2QbaF8EgQQ7aF3aTrBCzg8Ay6gVkvg65sJl
         lIMQ==
X-Forwarded-Encrypted: i=1; AKwUvByadcpiuE8vq+m4ypc4TCgJp7nHyImsEpXUsyu9cy3HBYFkUa171h+LgEne5UCDkZRYLi2gLS00IBI=@lists.infradead.org
X-Gm-Message-State: AFuF++m4QsBai91cxX8VJb0Lt+BA/2OepLjjhXYIBoJ0GW/ZmJYkgorP
	dlYxgLrgJmPF/b2sw4lZcPx37NKWex4Am3+PXXqQI2WbzTzRpTIKS7x1MisvT6X/jRs/Fh5t6ci
	6WZ7fZtyUv2zIwSPvfpT3I5hE/Tdp/07X+pISs6oL
X-Gm-Gg: AYBFou1xKxaLJuTxFktsaNHotCD03IIQxuWY9EMXNOwI/tNoBKktMOOu6DMP2hp4KEk
	FWVoWeL5Ck289LnE5j9MxyMD8lE3J7nsRhmhe6FiFL9skS50FYVnDKr/tp7a0oTIPTSnkbnMDZ2
	saG1uNzRPA/jyvQ76oTXW5DLzyhlHgWgQgDsiwwJHmAix3wzX4ALpU8PHAfenR7Mv/CAjAPuOcG
	u1k8tZvQXB6Ge9LrXOu9b3l6C/OcURwaNCg5rVHkNnCVCCDwxVThl7lx1NVoBp6wJa+zDg59ikf
	cirkHSkc44A+ijXIg4oMbBXPzssZ2hQbYwssZEd0j9PjNWXH7oXcDaF3
X-Received: by 2002:ac8:7e89:0:b0:534:b7b2:634f with SMTP id
 d75a77b69052e-53514799503mr16690141cf.8.1791136478525; Sun, 04 Oct 2026
 10:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-17-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-17-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 10:54:27 -0700
X-Gm-Features: AclHuK-Rg0T0ymL6HRAgNQPZX5D4YqOng-e9RJRoGVP6zixq0eakV-RXfXJpvBY
Message-ID: <CAJuCfpHM9-VY97TD8yXCEcWirLHik7UPf2_gv5CzqEexD2hbHg@mail.gmail.com>
Subject: Re: [PATCH v4 17/38] scsi: sg: convert mmap hook to mmap_prepare and rework
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_105442_987685_3EED5503 
X-CRM114-Status: GOOD (  30.89  )
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
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBNb3ZlIGZyb20gdGhlIGRlcHJlY2F0ZWQgbW1hcCBo
b29rIHRvIHRoZSBuZXcgbW1hcF9wcmVwYXJlIGhvb2suCj4KPiBXZSBhcmUgbWFwcGluZyBrZXJu
ZWwgcGFnZXMgaGVyZSwgc28gdXNlIHRoZSBkaXNjb250aWd1b3VzIGtlcm5lbCBtYXBwaW5nCj4g
bW1hcCBhY3Rpb24gdG8gZG8gc28uCj4KPiBVbndpbmQgdGhlIHJhdGhlciBjb25mdXNpbmcgbG9v
cCBhbmQgaW5zdGVhZCBtYXAgYXMgbWFueSBwYWdlcyBhcyB3ZSBjYW4gYXQKPiBvbmUgdGltZS4K
Pgo+IE5vdGUgdGhhdCB3ZSBkbyBub3QgbmVlZCB0byBwYXkgYXR0ZW50aW9uIHRvIHJzdl9zY2hw
LT5rX3VzZV9zZyBoZXJlLCBhcwo+IHRoZSBwYWdlcyBhcmUgcG9wdWxhdGVkIGZvciB0aGUgbGVu
Z3RoIG9mIHRoZSBidWZmZXIgYXQKPiByc3Zfc2NocC0+cGFnZV9vcmRlciBncmFudWxhcml0eSBh
cyBjb21wb3VuZCBwYWdlcy4KPgo+IFRoZSBkaXNjb250aWd1b3VzIGtlcm5lbCBwYWdlIG1hcHBp
bmcgbG9naWMgaGFuZGxlcyB0aGUgY29tcG91bmQgcGFnZXMgZm9yCj4gdXMuCj4KPiBzZnAtPm1t
YXBfY2FsbGVkIGtlZXBzIHRoZSBidWZmZXIgc3RhYmxlIGZvciB1cy4gQXMgYmVmb3JlIGl0IGlz
IG5ldmVyCj4gY2xlYXJlZCwgc28gYSBmYWlsZWQgbW1hcCBhbHNvIGxlYXZlcyBpdCBzZXQuCj4K
PiBXZSBhbHNvIHJlbW92ZSBzb21lIHVzZWxlc3Mgdm1hLCB2bWEtPnZtX2ZpbGUgTlVMTCBjaGVj
a3MgLSB0aGVzZSB3aWxsCj4gYWx3YXlzIGJlIG5vbi1OVUxMIGlmIHlvdSByZWFjaGVkIHRoZSBt
bWFwIGhvb2sgbG9naWMuCj4KPiBXZSByZXRhaW4gbG9nIG91dHB1dCBmb3IgY29uc2lzdGVuY3ks
IGJ1dCBjaGFuZ2Ugd2hhdCdzIG91dHB1dCBvbiBwYWdlCj4gbWFwcGluZyB0byBpbmRpY2F0ZSB0
aGF0IHNnX2Rpc2NvbnRpZ19nZXQoKSBkb2VzIHRoZSB3b3JrIG5vdy4KPgo+IE5vdGUgdGhhdCB3
ZSBkcm9wIHRoZSBWTUFfSU9fQklUIGZsYWcgZm9yIHRoZSBWTUEgaGVyZS4gSXQgd2FzIG5ldmVy
Cj4gbmVjZXNzYXJ5IGFzIHdlIGludm9rZSBhbGxvY19wYWdlcygpIHdoaWNoIGdpdmVzIHVzIHJl
ZmNvdW50ZWQgZm9saW9zIHRoYXQKPiBhcmUgZmluZSBmb3IgR1VQIHRvIGFjY2VzcyAoVk1BX0lP
X0JJVCB3b3VsZCBwcmV2ZW50IHRoYXQpLgo+Cj4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBTdG9h
a2VzIChBUk0pIDxsanNAa2VybmVsLm9yZz4KClRoZSBjb2RlIGxvb2tzIGNvcnJlY3QgYnV0IEkg
bXVzdCBkaXNjbGFpbSB0aGF0IEkgaGF2ZSBubyBleHBlcmllbmNlCndpdGggdGhpcyBkcml2ZXIu
CgpSZXZpZXdlZC1ieTogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4KCgo+
IC0tLQo+ICBkcml2ZXJzL3Njc2kvc2cuYyB8IDExNSArKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUxIGluc2Vy
dGlvbnMoKyksIDY0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc2NzaS9z
Zy5jIGIvZHJpdmVycy9zY3NpL3NnLmMKPiBpbmRleCA1NDA4ZjAwMmU2YzAuLjNmOWUwODcyNTYw
MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Njc2kvc2cuYwo+ICsrKyBiL2RyaXZlcnMvc2NzaS9z
Zy5jCj4gQEAgLTEyMTIsODUgKzEyMTIsNzIgQEAgc2dfZmFzeW5jKGludCBmZCwgc3RydWN0IGZp
bGUgKmZpbHAsIGludCBtb2RlKQo+ICAgICAgICAgcmV0dXJuIGZhc3luY19oZWxwZXIoZmQsIGZp
bHAsIG1vZGUsICZzZnAtPmFzeW5jX3FwKTsKPiAgfQo+Cj4gLXN0YXRpYyB2bV9mYXVsdF90Cj4g
LXNnX3ZtYV9mYXVsdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKPiArc3RhdGljIGludCBzZ19kaXNj
b250aWdfaW5pdCh2b2lkICp2bV9wcml2YXRlX2RhdGEsIHZvaWQgKipwcml2YXRlKQo+ICB7Cj4g
LSAgICAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSA9IHZtZi0+dm1hOwo+IC0gICAgICAg
U2dfZmQgKnNmcDsKPiAtICAgICAgIHVuc2lnbmVkIGxvbmcgb2Zmc2V0LCBsZW4sIHNhOwo+IC0g
ICAgICAgU2dfc2NhdHRlcl9ob2xkICpyc3Zfc2NocDsKPiAtICAgICAgIGludCBrLCBsZW5ndGg7
Cj4gLQo+IC0gICAgICAgaWYgKChOVUxMID09IHZtYSkgfHwgKCEoc2ZwID0gKFNnX2ZkICopIHZt
YS0+dm1fcHJpdmF0ZV9kYXRhKSkpCj4gLSAgICAgICAgICAgICAgIHJldHVybiBWTV9GQVVMVF9T
SUdCVVM7Cj4gLSAgICAgICByc3Zfc2NocCA9ICZzZnAtPnJlc2VydmU7Cj4gLSAgICAgICBvZmZz
ZXQgPSB2bWYtPnBnb2ZmIDw8IFBBR0VfU0hJRlQ7Cj4gLSAgICAgICBpZiAob2Zmc2V0ID49IHJz
dl9zY2hwLT5idWZmbGVuKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gVk1fRkFVTFRfU0lHQlVT
Owo+IC0gICAgICAgU0NTSV9MT0dfVElNRU9VVCgzLCBzZ19wcmludGsoS0VSTl9JTkZPLCBzZnAt
PnBhcmVudGRwLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInNnX3Zt
YV9mYXVsdDogb2Zmc2V0PSVsdSwgc2NhdGc9JWRcbiIsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBvZmZzZXQsIHJzdl9zY2hwLT5rX3VzZV9zZykpOwo+IC0gICAgICAg
c2EgPSB2bWEtPnZtX3N0YXJ0Owo+IC0gICAgICAgbGVuZ3RoID0gMSA8PCAoUEFHRV9TSElGVCAr
IHJzdl9zY2hwLT5wYWdlX29yZGVyKTsKPiAtICAgICAgIGZvciAoayA9IDA7IGsgPCByc3Zfc2No
cC0+a191c2Vfc2cgJiYgc2EgPCB2bWEtPnZtX2VuZDsgaysrKSB7Cj4gLSAgICAgICAgICAgICAg
IGxlbiA9IHZtYS0+dm1fZW5kIC0gc2E7Cj4gLSAgICAgICAgICAgICAgIGxlbiA9IChsZW4gPCBs
ZW5ndGgpID8gbGVuIDogbGVuZ3RoOwo+IC0gICAgICAgICAgICAgICBpZiAob2Zmc2V0IDwgbGVu
KSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBhZ2UgKnBhZ2UgPSByc3Zfc2No
cC0+cGFnZXNba10gKyAob2Zmc2V0ID4+IFBBR0VfU0hJRlQpOwo+IC0gICAgICAgICAgICAgICAg
ICAgICAgIGdldF9wYWdlKHBhZ2UpOyAvKiBpbmNyZW1lbnQgcGFnZSBjb3VudCAqLwo+IC0gICAg
ICAgICAgICAgICAgICAgICAgIHZtZi0+cGFnZSA9IHBhZ2U7Cj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIDA7IC8qIHN1Y2Nlc3MgKi8KPiAtICAgICAgICAgICAgICAgfQo+IC0gICAg
ICAgICAgICAgICBzYSArPSBsZW47Cj4gLSAgICAgICAgICAgICAgIG9mZnNldCAtPSBsZW47Cj4g
KyAgICAgICBjb25zdCB1bnNpZ25lZCBsb25nIHJlcV9zeiA9ICh1bnNpZ25lZCBsb25nKSpwcml2
YXRlOwo+ICsgICAgICAgU2dfZmQgKnNmcCA9IHZtX3ByaXZhdGVfZGF0YTsKPiArICAgICAgIFNn
X3NjYXR0ZXJfaG9sZCAqcnN2X3NjaHAgPSAmc2ZwLT5yZXNlcnZlOwo+ICsgICAgICAgaW50IGVy
ciA9IDA7Cj4gKwo+ICsgICAgICAgbXV0ZXhfbG9jaygmc2ZwLT5mX211dGV4KTsKPiArICAgICAg
IGlmIChyZXFfc3ogPiByc3Zfc2NocC0+YnVmZmxlbikgewo+ICsgICAgICAgICAgICAgICBlcnIg
PSAtRU5PTUVNOyAgLyogY2Fubm90IG1hcCBtb3JlIHRoYW4gcmVzZXJ2ZWQgYnVmZmVyICovCj4g
KyAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICsgICAgICAgfQo+ICsgICAgICAgc2ZwLT5tbWFw
X2NhbGxlZCA9IDE7IC8qIFByZXZlbnRzIGNoYW5nZXMgdG8gYnVmZmVyIHNpemUuICovCj4gK291
dDoKPiArICAgICAgIG11dGV4X3VubG9jaygmc2ZwLT5mX211dGV4KTsKPiArICAgICAgIHJldHVy
biBlcnI7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQKPiArc2dfZGlzY29udGlnX2dldChzdHJ1Y3Qg
ZGlzY29udGlnX2tlcm5lbF9wYWdlX3N0YXRlICpzdGF0ZSkKPiArewo+ICsgICAgICAgU2dfZmQg
KnNmcCA9IHN0YXRlLT52bV9wcml2YXRlX2RhdGE7Cj4gKyAgICAgICBTZ19zY2F0dGVyX2hvbGQg
KnJzdl9zY2hwID0gJnNmcC0+cmVzZXJ2ZTsKPiArICAgICAgIGNvbnN0IHVuc2lnbmVkIGludCBv
cmRlciA9IHJzdl9zY2hwLT5wYWdlX29yZGVyOwo+ICsgICAgICAgY29uc3QgcGdvZmZfdCBucl9w
YWdlcyA9IHN0YXRlLT5ucl9wYWdlc19tYXBwZWQ7Cj4gKwo+ICsgICAgICAgaWYgKG5yX3BhZ2Vz
ID49IChyc3Zfc2NocC0+YnVmZmxlbiA+PiBQQUdFX1NISUZUKSkgewo+ICsgICAgICAgICAgICAg
ICBkaXNjb250aWdfa2VybmVsX21hcF9hYm9ydChzdGF0ZSk7Cj4gKyAgICAgICAgICAgICAgIHJl
dHVybiAwOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICByZXR1cm4gVk1fRkFVTFRfU0lHQlVTOwo+
ICsgICAgICAgU0NTSV9MT0dfVElNRU9VVCgzLCBzZ19wcmludGsoS0VSTl9JTkZPLCBzZnAtPnBh
cmVudGRwLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiVzOiBvZmZz
ZXQ9JWx1LCBzY2F0Zz0lZFxuIiwgX19mdW5jX18sCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBucl9wYWdlcyA8PCBQQUdFX1NISUZULCByc3Zfc2NocC0+a191c2Vfc2cp
KTsKPiArCj4gKyAgICAgICBkaXNjb250aWdfa2VybmVsX21hcF9wYWdlKHN0YXRlLCByc3Zfc2No
cC0+cGFnZXNbbnJfcGFnZXMgPj4gb3JkZXJdKTsKPiArICAgICAgIHJldHVybiAwOwo+ICB9Cj4K
PiAtc3RhdGljIGNvbnN0IHN0cnVjdCB2bV9vcGVyYXRpb25zX3N0cnVjdCBzZ19tbWFwX3ZtX29w
cyA9IHsKPiAtICAgICAgIC5mYXVsdCA9IHNnX3ZtYV9mYXVsdCwKPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBkaXNjb250aWdfa2VybmVsX3BhZ2Vfb3BzIHNnX2Rpc2NvbnRpZ19vcHMgPSB7Cj4gKyAg
ICAgICAuaW5pdCA9IHNnX2Rpc2NvbnRpZ19pbml0LAo+ICsgICAgICAgLmdldCA9IHNnX2Rpc2Nv
bnRpZ19nZXQsCj4gIH07Cj4KPiAgc3RhdGljIGludAo+IC1zZ19tbWFwKHN0cnVjdCBmaWxlICpm
aWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiArc2dfbW1hcF9wcmVwYXJlKHN0cnVj
dCB2bV9hcmVhX2Rlc2MgKmRlc2MpCj4gIHsKPiAtICAgICAgIFNnX2ZkICpzZnA7Cj4gLSAgICAg
ICB1bnNpZ25lZCBsb25nIHJlcV9zeiwgbGVuLCBzYTsKPiAtICAgICAgIFNnX3NjYXR0ZXJfaG9s
ZCAqcnN2X3NjaHA7Cj4gLSAgICAgICBpbnQgaywgbGVuZ3RoOwo+IC0gICAgICAgaW50IHJldCA9
IDA7Cj4gKyAgICAgICBTZ19mZCAqc2ZwID0gZGVzYy0+ZmlsZS0+cHJpdmF0ZV9kYXRhOwo+ICsg
ICAgICAgY29uc3QgdW5zaWduZWQgbG9uZyByZXFfc3ogPSB2bWFfZGVzY19zaXplKGRlc2MpOwo+
Cj4gLSAgICAgICBpZiAoKCFmaWxwKSB8fCAoIXZtYSkgfHwgKCEoc2ZwID0gKFNnX2ZkICopIGZp
bHAtPnByaXZhdGVfZGF0YSkpKQo+ICsgICAgICAgaWYgKCFzZnApCj4gICAgICAgICAgICAgICAg
IHJldHVybiAtRU5YSU87Cj4gLSAgICAgICByZXFfc3ogPSB2bWEtPnZtX2VuZCAtIHZtYS0+dm1f
c3RhcnQ7Cj4gKwo+ICAgICAgICAgU0NTSV9MT0dfVElNRU9VVCgzLCBzZ19wcmludGsoS0VSTl9J
TkZPLCBzZnAtPnBhcmVudGRwLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgInNnX21tYXAgc3RhcnRpbmcsIHZtX3N0YXJ0PSVwLCBsZW49JWRcbiIsCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodm9pZCAqKSB2bWEtPnZtX3N0YXJ0LCAoaW50
KSByZXFfc3opKTsKPiAtICAgICAgIGlmICh2bWEtPnZtX3Bnb2ZmKQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKHZvaWQgKikgZGVzYy0+c3RhcnQsIChpbnQpIHJlcV9z
eikpOwo+ICsKPiArICAgICAgIGlmIChkZXNjLT5wZ29mZikKPiAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7IC8qIHdhbnQgbm8gb2Zmc2V0ICovCj4gLSAgICAgICByc3Zfc2NocCA9ICZz
ZnAtPnJlc2VydmU7Cj4gLSAgICAgICBtdXRleF9sb2NrKCZzZnAtPmZfbXV0ZXgpOwo+IC0gICAg
ICAgaWYgKHJlcV9zeiA+IHJzdl9zY2hwLT5idWZmbGVuKSB7Cj4gLSAgICAgICAgICAgICAgIHJl
dCA9IC1FTk9NRU07ICAvKiBjYW5ub3QgbWFwIG1vcmUgdGhhbiByZXNlcnZlZCBidWZmZXIgKi8K
PiAtICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gLSAgICAgICB9Cj4KPiAtICAgICAgIHNhID0g
dm1hLT52bV9zdGFydDsKPiAtICAgICAgIGxlbmd0aCA9IDEgPDwgKFBBR0VfU0hJRlQgKyByc3Zf
c2NocC0+cGFnZV9vcmRlcik7Cj4gLSAgICAgICBmb3IgKGsgPSAwOyBrIDwgcnN2X3NjaHAtPmtf
dXNlX3NnICYmIHNhIDwgdm1hLT52bV9lbmQ7IGsrKykgewo+IC0gICAgICAgICAgICAgICBsZW4g
PSB2bWEtPnZtX2VuZCAtIHNhOwo+IC0gICAgICAgICAgICAgICBsZW4gPSAobGVuIDwgbGVuZ3Ro
KSA/IGxlbiA6IGxlbmd0aDsKPiAtICAgICAgICAgICAgICAgc2EgKz0gbGVuOwo+IC0gICAgICAg
fQo+ICsgICAgICAgdm1hX2Rlc2Nfc2V0X2ZsYWdzKGRlc2MsIFZNQV9ET05URVhQQU5EX0JJVCwg
Vk1BX0RPTlREVU1QX0JJVCk7Cj4gKyAgICAgICBkZXNjLT5wcml2YXRlX2RhdGEgPSBzZnA7Cj4K
PiAtICAgICAgIHNmcC0+bW1hcF9jYWxsZWQgPSAxOwo+IC0gICAgICAgdm1fZmxhZ3Nfc2V0KHZt
YSwgVk1fSU8gfCBWTV9ET05URVhQQU5EIHwgVk1fRE9OVERVTVApOwo+IC0gICAgICAgdm1hLT52
bV9wcml2YXRlX2RhdGEgPSBzZnA7Cj4gLSAgICAgICB2bWEtPnZtX29wcyA9ICZzZ19tbWFwX3Zt
X29wczsKPiAtb3V0Ogo+IC0gICAgICAgbXV0ZXhfdW5sb2NrKCZzZnAtPmZfbXV0ZXgpOwo+IC0g
ICAgICAgcmV0dXJuIHJldDsKPiArICAgICAgIG1tYXBfYWN0aW9uX21hcF9kaXNjb250aWdfa2Vy
bmVsX3BhZ2VzKGRlc2MsICh2b2lkICopcmVxX3N6LAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgJnNnX2Rpc2NvbnRpZ19vcHMpOwo+ICsgICAgICAgcmV0
dXJuIDA7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZAo+IEBAIC0xNDE1LDcgKzE0MDIsNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBzZ19mb3BzID0gewo+ICAgICAgICAgLnVu
bG9ja2VkX2lvY3RsID0gc2dfaW9jdGwsCj4gICAgICAgICAuY29tcGF0X2lvY3RsID0gY29tcGF0
X3B0cl9pb2N0bCwKPiAgICAgICAgIC5vcGVuID0gc2dfb3BlbiwKPiAtICAgICAgIC5tbWFwID0g
c2dfbW1hcCwKPiArICAgICAgIC5tbWFwX3ByZXBhcmUgPSBzZ19tbWFwX3ByZXBhcmUsCj4gICAg
ICAgICAucmVsZWFzZSA9IHNnX3JlbGVhc2UsCj4gICAgICAgICAuZmFzeW5jID0gc2dfZmFzeW5j
LAo+ICB9Owo+Cj4gLS0KPiAyLjU1LjAKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3Zt
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
