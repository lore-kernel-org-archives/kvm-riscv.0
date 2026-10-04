Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE7FCA5FE6
	for <kvm-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 17:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AI/zD8cekxBlNATwb8a7E33f1be4mZmLSrzSr3dedJo=; b=xWHx15V7PJUa54
	zed3p10hz2pLpWIawcMOm0DhpAngOQ73E4ZiUCkVl/+TMzPEWFbobKhLYIyEmiqzSIy6LkpEylnDO
	AEGNpN/23L9abPGnuzzE/4Gi/OBf1QH3j2bADjSPPyDSIXndh2624WBoZM2H7NY51bSHScOxzcNPq
	ET/HZvJXJv34aXvLuYD2p9VuHy1h56dZgu0KiIkebeTWGJ2Anu3psk2s5sYibmHfWaRjuceD8IETo
	iP4IUwRZ7B1mQ4+ue1l0/RS0woxtlMPFfEP7KU89gV9gL7yUndyrkOQtSzyW8z1127FLcxpseoUQ+
	07DTafLQFC5DMgvaDTgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQOJ-0000000F8pP-0UsJ;
	Sun, 04 Oct 2026 17:52:51 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDQOE-0000000F8oG-4346
	for kvm-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 17:52:49 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-5351f9dbfe0so96811cf.1
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Oct 2026 10:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791136365; cv=none;
        d=google.com; s=arc-20260327;
        b=N1QAy8JTbewbVMP3wQ9jeWNhor3+eTR2xitiHE+MB6nfV9s41AKtrjdXzakkTEK8vc
         rt0WrWCRfsp2qMvSiCeXFa1TG5DCizgnG7BtsIKHkN6D/AQQv0UVoiPdLY52F08uxzge
         wn1L/DMxvGOBjzqZwCUgPuhsDYGvfRUdtFT4SKkpy8IlN9XEE4FLwFYt9LRwc/RX4msq
         v/sEYpRqgMwC9Aq6Gr8534sgxWps7yIAc92QGpJ2Rb4XTr3lMIh6unGIoFG36KB1SV/H
         8DaK/ihMsxlUw2mqtvkKJoONZRb4LlQB3Odjkfk5aOLoPWaCMSivMhs9yPI6HRbfpO7S
         aw9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hGuGLrOvm4LeUyfXJ5B4JaitM98XinzaQN/wjAvVcwQ=;
        fh=b0CmfWz/yYEq0HJP/ru+2yMi8xlxjwQ75ui4HtHrC8w=;
        b=Xd4gsi5pSbszTX/2sm5vKBdhw2FUCRVbxQ/7QaKohVI2cEKZXiW9VYIp46APAB2ylv
         VJ4I6lyasdtDQQZynRKSuil+bY44VX8ZbLGTYc/P5mATAnQmtQHjFCBH5jWnx9qcZY8N
         ef2rTWLMnQgXqb0Kfs157bjCnXToOjukUkzADXAYRCjaikL0GRJLcRxCH1HVg5wdw5HO
         iuvunxj8VxSiYK8FksM0eYCO3IcYELixnBm0Bzlp+EeaGPswbJOELrJzmfgy5Tpa8iGL
         G09cdATadVdcgxX1YJBfhOm1a4u6CkX5L86pNv+c1ZFDG/doBgKUG2H4RgxqGTxy/2VC
         nn5A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791136365; x=1791741165; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hGuGLrOvm4LeUyfXJ5B4JaitM98XinzaQN/wjAvVcwQ=;
        b=kMxcrv8R+w5T4+Chb1xwpLKut3V4EDI8gI1nI6+hJWxaf/VhfpeCDANAh1Ksr6DC9c
         kWhhFYRmUJD5QHmWTTAww/2ctdK1IJTnLkY1Z/YmHlJhxPL0Qqlg0maMJKoYOscjt6e1
         sfeZFPmzeZZd/12+jdRlDXa5xq+uJmvoiRtpqN+1HUq5cRW+Fdl8p41Ka1copYlPaBVF
         riS3hGtTvQs53xl6eRtnplFqWQfhg7NmpGp83Wj6s89z64sW2xnm6/PGNWYC+mda2p0L
         z5IAGwevoFr6KNQhn1tUTgjj3Bo9KRRy9uJ/eSdIBTuFeNU19V8ekfalJMPrPZseFSaa
         F7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791136365; x=1791741165;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGuGLrOvm4LeUyfXJ5B4JaitM98XinzaQN/wjAvVcwQ=;
        b=GmiK5VIxHM8k+Q1Oo46vArGaHTZhz5r3aZ8LishVRpfcADHOXC1MLTsoGfrBmqMw8Q
         Pe1sPV1iK4oM+xd+4szFSAr//MxAyBCZqVciTolc0RArFldgJTi9lLuYIPMCrfzP5oup
         GbUiIKXJLrFqK691YNWQR6UvZ7hk3rN3voyTyRQ6ocTOAowX4+wR0soFhJdzvyl3qwps
         JnZtMkKkaDjFs/38ZthE/30+KB7+S8QRuaie21r/ynK6QFCU5PRGftrM1Bmjog4eDkUF
         7jyyo8mr5aVgVf5nJdoi5PzTwfBjF7+iiWKC0yIcSSIq5Dk86X2wXaTmqMhkKfOL50HW
         2qtw==
X-Forwarded-Encrypted: i=1; AKwUvBwyvDkuIkYvzCz6PHhSGPzLXF97K2Iprrdpwx1MkIRFGFkzh3erAX5ZavVBntOYag06U2TmZDEBP8U=@lists.infradead.org
X-Gm-Message-State: AFuF++mVbvovAbjHzuGkHdHac0Saw0H7BrYoDfWU5T0VrCwNpF0deew6
	qI+8XlXIatUc+CEHekTBnR0ip+TsCeTPx9FqeI5fmRYAOV2/iYc8+YFxKKyIlznpfZgEj6oEEz5
	BOspVIerYaXhXcLvjqcToTJ8yaumlepD86bvVa5dF
X-Gm-Gg: AYBFou30p3j9NxDaeko8JrYg+MZiY6jEmVXk/Vq3UoQkem36xVox1jPUspz0aniCdOe
	YbfgP7AMVQATMBq2b0qpHqjXHpna5nnC/hUgv3m5XCEZnmomcWeSuoIrMZwgM0YjM/5ssZKmL55
	cokqSqw/THbd2sSGulcC6xxfhv9VsVH8MOcoOXc15jK7ShIvNxWd2hrAcPXUB8DdOTy+W2eSFDy
	Q+SSgm59d08MJhCmbcKHlkciOkVm701UsSc1R3Gw8/6hHhk/mj+u/GYAeCrsLx4abSvkuDe8y1/
	LRCEUn3NWCClqF3D/40JKVKyU+saoolhBb1eZQuxxOJYrQP63tDD++bOeQ==
X-Received: by 2002:ac8:7fd1:0:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-535143a7ee5mr16757211cf.0.1791136364655; Sun, 04 Oct 2026
 10:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-16-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-16-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 10:52:33 -0700
X-Gm-Features: AclHuK97kMRDYoB6lQW3TrcrLHtwyxFXHppfod8Uz1hqyRH7vKfp8a9EoRVxxRQ
Message-ID: <CAJuCfpHQwLZiXqsC2BsC6tUACJOMFfyLp9KC2w22NnzM5Ncrmg@mail.gmail.com>
Subject: Re: [PATCH v4 16/38] mm/vma: add and use vma_[flags]_is_fixed_mapping
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_105248_643540_5FAE685F 
X-CRM114-Status: GOOD (  35.09  )
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
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIGRldGVybWluZXMgd2hldGhlciBhIFZNQSBj
YW5ub3QgYmUgZXhwYW5kZWQgb3IgbWVyZ2VkIGJlY2F1c2Ugd2hhdAo+IHRoZXkgbWFwcGVkIHdh
cyBkZXRlcm1pbmVkIHRvIGJlIGEgc2V0IHNpemUgYXQgbW1hcCB0aW1lLgo+Cj4gVGhpcyB0eXBp
Y2FsbHkgcmVmZXJzIHRvIG1hcHBpbmdzIG5vdCBtYW5hZ2VkIGJ5IGNvcmUgbW0sIGhvd2V2ZXIK
PiBWTUFfRE9OVEVYUEFORF9CSVQKPiBpcyBub3QgcmVsaWFibHkgc2V0IGFsb25nc2lkZSBWTUFf
UEZOTUFQX0JJVCBvciBWTUFfTUlYRURNQVBfQklULCBzbyB3ZQo+IG11c3QgZXhwbGljaXRseSB0
ZXN0IGZvciB0aGlzIGZvciBub3cuCj4KPiBXZSBhbHNvIGV4cGxpY2l0bHkgdGVzdCBmb3IgVk1B
X1BGTk1BUF9CSVQgYXMgVk1BX0RPTlRFWFBBTkRfQklUIG1heSBub3QgYmUKPiBzZXQgZm9yIFZN
QV9QRk5NQVBfQklUJ3MgZGVzcGl0ZSB0aGUgb25lIGltcGx5aW5nIHRoZSBvdGhlci4KPgo+IFVz
ZSB0aGlzIHByZWRpY2F0ZSBpbiB2bWFfZmxhZ3NfY2FuX21lcmdlKCkgYW5kIGluIGNoZWNrX3By
ZXBfdm1hKCkgaW4gdGhlCj4gbXJlbWFwIGxvZ2ljIHRlc3RpbmcgdG8gc2VlIGlmIG1yZW1hcCgp
IGNhbiBleHBhbmQgdGhlIFZNQS4gVGhlIGNyaXRlcmlhCj4gZm9yIGtodWdlcGFnZWQgYW5kIE1B
RFZfQ09MTEFQU0UgZWxpZ2liaWxpdHkgaW4KPiBfX3RocF92bWFfYWxsb3dhYmxlX29yZGVycygp
IGFyZSBwcmVjaXNlbHkgdGhvc2UgZm9yIG1lcmdlYWJpbGl0eSwgc28gdXNlCj4gdm1hX2Nhbl9t
ZXJnZSgpIHRoZXJlICh3aXRoIGFuIGV4cGFuZGVkIGNvbW1lbnQpLgo+Cj4gVGhpcyBvYnZpYXRl
cyB0aGUgbmVlZCBmb3IgdGhlIFZNX05PX0tIVUdFUEFHRUQgbWFzaywgc28gcmVtb3ZlIGl0Lgo+
Cj4gSHVnZXRsYiBWTUFzIHJlbWFpbiBleGNsdWRlZCBmcm9tIGtodWdlcGFnZWQgYXMgaHVnZXRs
YmZzIGFsd2F5cyBzZXRzCj4gVk1BX0RPTlRFWFBBTkRfQklULgo+Cj4gQWxzbyB1cGRhdGUgdGhl
IHVzZXJsYW5kIFZNQSB0ZXN0cyB0byByZWZsZWN0IHRoZSBjaGFuZ2UuCj4KPiBObyBmdW5jdGlv
bmFsIGNoYW5nZSBpbnRlbmRlZC4KPgo+IFJldmlld2VkLWJ5OiBaaSBZYW4gPHppeUBudmlkaWEu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IExvcmVuem8gU3RvYWtlcyAoQVJNKSA8bGpzQGtlcm5lbC5v
cmc+CgpSZXZpZXdlZC1ieTogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJlbmJAZ29vZ2xlLmNvbT4K
Cgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L21tLmggICAgICAgICAgICAgIHwgMzkgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tCj4gIG1tL2h1Z2VfbWVtb3J5LmMgICAgICAg
ICAgICAgICAgfCAxMSArKysrKysrLS0tLQo+ICBtbS9tcmVtYXAuYyAgICAgICAgICAgICAgICAg
ICAgIHwgIDUgKystLS0KPiAgdG9vbHMvdGVzdGluZy92bWEvaW5jbHVkZS9kdXAuaCB8IDE2ICsr
KysrKysrKysrKysrKy0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspLCAxMiBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tLmggYi9pbmNsdWRl
L2xpbnV4L21tLmgKPiBpbmRleCA4Mzk1Mzc1NzczNWEuLjZiNWYwNmNkMTc0YSAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL2xpbnV4L21tLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L21tLmgKPiBAQCAt
NjAwLDkgKzYwMCw2IEBAIGVudW0gewo+ICAjZGVmaW5lIFZNQV9SRU1BUF9GTEFHUyBta192bWFf
ZmxhZ3MoVk1BX0lPX0JJVCwgVk1BX1BGTk1BUF9CSVQsICAgICAgIFwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgVk1BX0RPTlRFWFBBTkRfQklULCBWTUFfRE9OVERVTVBf
QklUKQo+Cj4gLS8qIFRoaXMgbWFzayBwcmV2ZW50cyBWTUEgZnJvbSBiZWluZyBzY2FubmVkIHdp
dGgga2h1Z2VwYWdlZCAqLwo+IC0jZGVmaW5lIFZNX05PX0tIVUdFUEFHRUQgKFZNX1NQRUNJQUwg
fCBWTV9IVUdFVExCKQo+IC0KPiAgLyogVGhpcyBtYXNrIGRlZmluZXMgd2hpY2ggbW0tPmRlZl9m
bGFncyBhIHByb2Nlc3MgY2FuIGluaGVyaXQgaXRzIHBhcmVudCAqLwo+ICAjZGVmaW5lIFZNX0lO
SVRfREVGX01BU0sgICAgICAgVk1fTk9IVUdFUEFHRQo+Cj4gQEAgLTE2NDcsNiArMTY0NCw0MCBA
QCBzdGF0aWMgaW5saW5lIGJvb2wgdm1hX2lzX21tX21hbmFnZWQoY29uc3Qgc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEpCj4gICAgICAgICByZXR1cm4gdm1hX2ZsYWdzX2lzX21tX21hbmFnZWQo
JnZtYS0+ZmxhZ3MpOwo+ICB9Cj4KPiArLyoqCj4gKyAqIHZtYV9mbGFnc19pc19maXhlZF9tYXBw
aW5nKCkgLSBEbyB0aGUgc3BlY2lmaWVkIFZNQSBmbGFncyBpbmRpY2F0ZSB0aGF0IHRoaXMKPiAr
ICogaXMgYSBmaXhlZCBtYXBwaW5nIHRoYXQgY2Fubm90IGJlIGV4cGFuZGVkIG9yIG1lcmdlZD8K
PiArICogQGZsYWdzOiBUaGUgVk1BIGZsYWdzIHRvIHRlc3QuCj4gKyAqCj4gKyAqIEZpeGVkIG1h
cHBpbmdzIGFyZSB0aG9zZSB3aG9zZSBzaXplIGlzIHNldCBhdCB0aGUgcG9pbnQgb2YgbW1hcCAo
Zm9yCj4gKyAqIGluc3RhbmNlLCBhIG1hcHBpbmcgb2YgYSBmaXhlZCByYW5nZSBvZiBtZW1vcnkg
ZXN0YWJsaXNoZWQgYnkgYSBkcml2ZXIpLAo+ICsgKiBhbmQgdGh1cyBjYW5ub3QgYmUgZXhwYW5k
ZWQgb3IgbWVyZ2VkLgo+ICsgKgo+ICsgKiBSZXR1cm5zOiB0cnVlIGlmIHRoZSBmbGFncyBpbmRp
Y2F0ZSBhIGZpeGVkIG1hcHBpbmcuCj4gKyAqLwo+ICtzdGF0aWMgaW5saW5lIGJvb2wgdm1hX2Zs
YWdzX2lzX2ZpeGVkX21hcHBpbmcoY29uc3Qgdm1hX2ZsYWdzX3QgKmZsYWdzKQo+ICt7Cj4gKyAg
ICAgICAvKgo+ICsgICAgICAgICogVk1BX1BGTk1BUF9CSVQgc2hvdWxkIGltcGx5IFZNQV9ET05U
RVhQQU5EX0JJVCwgYnV0IHNvbWUgY2FsbGVycyBzZXQKPiArICAgICAgICAqIG9ubHkgdGhlIGZv
cm1lci4KPiArICAgICAgICAqLwo+ICsgICAgICAgcmV0dXJuIHZtYV9mbGFnc190ZXN0X2FueShm
bGFncywgVk1BX1BGTk1BUF9CSVQsIFZNQV9ET05URVhQQU5EX0JJVCk7Cj4gK30KPiArCj4gKy8q
Kgo+ICsgKiB2bWFfaXNfZml4ZWRfbWFwcGluZygpIC0gSXMgdGhpcyBWTUEgYSBmaXhlZCBtYXBw
aW5nIHRoYXQgY2Fubm90IGJlCj4gKyAqIGV4cGFuZGVkIG9yIG1lcmdlZD8KPiArICogQHZtYTog
VGhlIFZNQSB0byB0ZXN0Lgo+ICsgKgo+ICsgKiBTZWUgdm1hX2ZsYWdzX2lzX2ZpeGVkX21hcHBp
bmcoKSBmb3IgYSBkZXNjcmlwdGlvbiBvZiB0aGlzIHByb3BlcnR5Lgo+ICsgKgo+ICsgKiBSZXR1
cm5zOiB0cnVlIGlmIHRoZSBWTUEgbWFwcyBhIGZpeGVkIG1hcHBpbmcuCj4gKyAqLwo+ICtzdGF0
aWMgaW5saW5lIGJvb2wgdm1hX2lzX2ZpeGVkX21hcHBpbmcoY29uc3Qgc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEpCj4gK3sKPiArICAgICAgIHJldHVybiB2bWFfZmxhZ3NfaXNfZml4ZWRfbWFw
cGluZygmdm1hLT5mbGFncyk7Cj4gK30KPiArCj4gIC8qKgo+ICAgKiB2bWFfZmxhZ3NfY2FuX21l
cmdlKCkgLSBEbyB0aGUgc3BlY2lmaWVkIFZNQSBmbGFncyBwZXJtaXQgdGhlIFZNQSB0byBiZQo+
ICAgKiBtZXJnZWQgd2l0aCBhbm90aGVyPwo+IEBAIC0xNjY4LDcgKzE2OTksNyBAQCBzdGF0aWMg
aW5saW5lIGJvb2wgdm1hX2ZsYWdzX2Nhbl9tZXJnZShjb25zdCB2bWFfZmxhZ3NfdCAqZmxhZ3Mp
Cj4gICAgICAgICBpZiAoIXZtYV9mbGFnc19pc19tbV9tYW5hZ2VkKGZsYWdzKSkKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICAgICAgICAgLyogVk1BIGV4cGxpY2l0bHkgbWFya2Vk
IGFzIGJlaW5nIHVubWVyZ2VhYmxlLiAqLwo+IC0gICAgICAgaWYgKHZtYV9mbGFnc190ZXN0KGZs
YWdzLCBWTUFfRE9OVEVYUEFORF9CSVQpKQo+ICsgICAgICAgaWYgKHZtYV9mbGFnc19pc19maXhl
ZF9tYXBwaW5nKGZsYWdzKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Cj4gICAg
ICAgICByZXR1cm4gdHJ1ZTsKPiBkaWZmIC0tZ2l0IGEvbW0vaHVnZV9tZW1vcnkuYyBiL21tL2h1
Z2VfbWVtb3J5LmMKPiBpbmRleCA0Y2Q5MTdmNzdmM2YuLjg3ZThiZjgwMjlhYiAxMDA2NDQKPiAt
LS0gYS9tbS9odWdlX21lbW9yeS5jCj4gKysrIGIvbW0vaHVnZV9tZW1vcnkuYwo+IEBAIC0yMTIs
MTEgKzIxMiwxNCBAQCB1bnNpZ25lZCBsb25nIF9fdGhwX3ZtYV9hbGxvd2FibGVfb3JkZXJzKHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAo+ICAgICAgICAgICAgICAgICByZXR1cm4gaW5fcGYg
PyBvcmRlcnMgOiAwOwo+Cj4gICAgICAgICAvKgo+IC0gICAgICAgICoga2h1Z2VwYWdlZCBzcGVj
aWFsIFZNQSBhbmQgaHVnZXRsYiBWTUEuCj4gLSAgICAgICAgKiBNdXN0IGJlIGNoZWNrZWQgYWZ0
ZXIgZGF4IHNpbmNlIHNvbWUgZGF4IG1hcHBpbmdzIG1heSBoYXZlCj4gLSAgICAgICAgKiBWTV9N
SVhFRE1BUCBzZXQuCj4gKyAgICAgICAgKiBraHVnZXBhZ2VkIG1vdmVzIGRhdGEgZnJvbSBWTUFz
IG9uY2UgY29sbGFwc2VkLCBhZnRlciB0aGV5IGhhdmUgYmVlbgo+ICsgICAgICAgICogZmF1bHRl
ZCBpbiwgcmVseWluZyBvbiByZWZhdWx0aW5nIGZvciBmaWxlLWJhY2tlZCBtZW1vcnkuCj4gKyAg
ICAgICAgKgo+ICsgICAgICAgICogTWFwcGluZ3Mgbm90IG1hbmFnZWQgYnkgY29yZSBtbSBjYW5u
b3QgYmUgcmVsaWFibHkgcmVjb25zdHJ1Y3RlZCBmcm9tCj4gKyAgICAgICAgKiBwYWdlIGZhdWx0
cywgYW5kIGZpeGVkIG1hcHBpbmdzIChpbmNsdWRpbmcgaHVnZXRsYikgbWF5IHdlbGwgYmUKPiAr
ICAgICAgICAqIG1tLW1hbmFnZWQgLSBwcmVjaXNlbHkgdGhlIG1hcHBpbmdzIHdoaWNoIGNhbm5v
dCBiZSBtZXJnZWQuCj4gICAgICAgICAgKi8KPiAtICAgICAgIGlmICghaW5fcGYgJiYgIXNtYXBz
ICYmICh2bV9mbGFncyAmIFZNX05PX0tIVUdFUEFHRUQpKQo+ICsgICAgICAgaWYgKCFpbl9wZiAm
JiAhc21hcHMgJiYgIXZtYV9jYW5fbWVyZ2Uodm1hKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJu
IDA7Cj4KPiAgICAgICAgIC8qCj4gZGlmZiAtLWdpdCBhL21tL21yZW1hcC5jIGIvbW0vbXJlbWFw
LmMKPiBpbmRleCA3YzM2ODQ0MGZhZmUuLmVkMTliNDdjMmNhZiAxMDA2NDQKPiAtLS0gYS9tbS9t
cmVtYXAuYwo+ICsrKyBiL21tL21yZW1hcC5jCj4gQEAgLTE3ODgsOCArMTc4OCw3IEBAIHN0YXRp
YyBpbnQgY2hlY2tfcHJlcF92bWEoc3RydWN0IHZtYV9yZW1hcF9zdHJ1Y3QgKnZybSkKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIGlmICgo
dnJtLT5mbGFncyAmIE1SRU1BUF9ET05UVU5NQVApICYmCj4gLSAgICAgICAgICAgdm1hX3Rlc3Rf
YW55KHZtYSwgVk1BX0RPTlRFWFBBTkRfQklULCBWTUFfUEZOTUFQX0JJVCkpCj4gKyAgICAgICBp
ZiAoKHZybS0+ZmxhZ3MgJiBNUkVNQVBfRE9OVFVOTUFQKSAmJiB2bWFfaXNfZml4ZWRfbWFwcGlu
Zyh2bWEpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPgo+ICAgICAgICAgLyoK
PiBAQCAtMTgyNyw3ICsxODI2LDcgQEAgc3RhdGljIGludCBjaGVja19wcmVwX3ZtYShzdHJ1Y3Qg
dm1hX3JlbWFwX3N0cnVjdCAqdnJtKQo+ICAgICAgICAgaWYgKHBnb2ZmICsgKG5ld19sZW4gPj4g
UEFHRV9TSElGVCkgPCBwZ29mZikKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4K
PiAtICAgICAgIGlmICh2bWFfdGVzdF9hbnkodm1hLCBWTUFfRE9OVEVYUEFORF9CSVQsIFZNQV9Q
Rk5NQVBfQklUKSkKPiArICAgICAgIGlmICh2bWFfaXNfZml4ZWRfbWFwcGluZyh2bWEpKQo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsKPgo+ICAgICAgICAgaWYgKCFtbG9ja19mdXR1
cmVfb2sobW0sIHZtYV90ZXN0KHZtYSwgVk1BX0xPQ0tFRF9CSVQpLCB2cm0tPmRlbHRhKSkKPiBk
aWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy92bWEvaW5jbHVkZS9kdXAuaCBiL3Rvb2xzL3Rlc3Rp
bmcvdm1hL2luY2x1ZGUvZHVwLmgKPiBpbmRleCA4OWM2NDVhNmFkNjAuLjQ0MmVhOWViMDk4ZCAx
MDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3ZtYS9pbmNsdWRlL2R1cC5oCj4gKysrIGIvdG9v
bHMvdGVzdGluZy92bWEvaW5jbHVkZS9kdXAuaAo+IEBAIC0xNjc2LDYgKzE2NzYsMjAgQEAgc3Rh
dGljIGlubGluZSBib29sIHZtYV9pc19tbV9tYW5hZ2VkKGNvbnN0IHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hKQo+ICAgICAgICAgcmV0dXJuIHZtYV9mbGFnc19pc19tbV9tYW5hZ2VkKCZ2bWEt
PmZsYWdzKTsKPiAgfQo+Cj4gK3N0YXRpYyBpbmxpbmUgYm9vbCB2bWFfZmxhZ3NfaXNfZml4ZWRf
bWFwcGluZyhjb25zdCB2bWFfZmxhZ3NfdCAqZmxhZ3MpCj4gK3sKPiArICAgICAgIC8qCj4gKyAg
ICAgICAgKiBWTUFfUEZOTUFQX0JJVCBzaG91bGQgaW1wbHkgVk1BX0RPTlRFWFBBTkRfQklULCBi
dXQgc29tZSBjYWxsZXJzIHNldAo+ICsgICAgICAgICogb25seSB0aGUgZm9ybWVyLgo+ICsgICAg
ICAgICovCj4gKyAgICAgICByZXR1cm4gdm1hX2ZsYWdzX3Rlc3RfYW55KGZsYWdzLCBWTUFfUEZO
TUFQX0JJVCwgVk1BX0RPTlRFWFBBTkRfQklUKTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSBi
b29sIHZtYV9pc19maXhlZF9tYXBwaW5nKGNvbnN0IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
KQo+ICt7Cj4gKyAgICAgICByZXR1cm4gdm1hX2ZsYWdzX2lzX2ZpeGVkX21hcHBpbmcoJnZtYS0+
ZmxhZ3MpOwo+ICt9Cj4gKwo+ICBzdGF0aWMgaW5saW5lIGJvb2wgdm1hX2ZsYWdzX2Nhbl9tZXJn
ZShjb25zdCB2bWFfZmxhZ3NfdCAqZmxhZ3MpCj4gIHsKPiAgICAgICAgIC8qCj4gQEAgLTE2OTEs
NyArMTcwNSw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCB2bWFfZmxhZ3NfY2FuX21lcmdlKGNvbnN0
IHZtYV9mbGFnc190ICpmbGFncykKPiAgICAgICAgIGlmICghdm1hX2ZsYWdzX2lzX21tX21hbmFn
ZWQoZmxhZ3MpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gICAgICAgICAvKiBW
TUEgZXhwbGljaXRseSBtYXJrZWQgYXMgYmVpbmcgdW5tZXJnZWFibGUuICovCj4gLSAgICAgICBp
ZiAodm1hX2ZsYWdzX3Rlc3QoZmxhZ3MsIFZNQV9ET05URVhQQU5EX0JJVCkpCj4gKyAgICAgICBp
ZiAodm1hX2ZsYWdzX2lzX2ZpeGVkX21hcHBpbmcoZmxhZ3MpKQo+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gZmFsc2U7Cj4KPiAgICAgICAgIHJldHVybiB0cnVlOwo+Cj4gLS0KPiAyLjU1LjAKPgoK
LS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
