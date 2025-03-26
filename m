Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB44AC36008
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 09:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LmOf0BKPoKugBdctGIUfp5hJgl9O4gwP2kmPFmmBYQE=; b=ikzGMQyF6CUNh0
	DnfYqYOssamk8VhjriMMqQ/deTcNwKM8Og6Q90FcLynM6SCrXd3qQ8R2Eg5cnYUEGX30VYxbXJHxY
	mzxQGGEatnknbM9/AgtUgah9GGPII8JLZQz46wH3mgj7HHrlWEUcS9An9iTBeIIMDv+1xZPklJy8o
	JE31YFMzqkIm50gTs5A5HcsKKSixMGMd/LwFlZo09NXNlSxTdQ2Mk4ELkOi1rTUWzsNUBALv287Fb
	DTn3IKD0kqAP3npoQins9OAKyYiaPl9N+IpJdMAltQ4tSrXAoeiFTyb9AILGR24LULspmVyq7NBPx
	uSHv5VqQ5NpBOlm+2+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txN0U-000000081WL-0yx9;
	Wed, 26 Mar 2025 09:25:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMyP-0000000814R-3N96;
	Wed, 26 Mar 2025 09:22:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D7FDF61145;
	Wed, 26 Mar 2025 09:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2DFC4CEED;
	Wed, 26 Mar 2025 09:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742980976;
	bh=qxtF6khLwId9LK15aaIK1R6QxhmJS+7IKsOAe3rcYSQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s50PwZt5zoEHQFKwW/oYZWE1K07t8vLMrgQRSGzC/Oy/aL79dZg+dbtEjlleSecDT
	 VtdygfOfXFS/GCiVqXkKIKE3s0Oq6/xcwKqAMQx2EadKeHnI1N+NSwSr4CrsSrat0a
	 s87heplEso1LAhDM3bqU7MxGGrioRLbJT3hCTEqLu3r7MwSqIEtLDK4Gb8MM14sIBc
	 f1unkZELp8aSlPGMn9CR2JsUxtBm+xvZEqn5EgNDFQtp67ynt6vhbCVwZObLSngZLT
	 rLgeBMwEQauN+k0rw/PTd/s3vdYaki8t/S+mmO5ODNjwPWTJUp5GN634XLwZJ6ze4f
	 +KtDEcmx4hwfA==
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3965c995151so3255579f8f.1;
        Wed, 26 Mar 2025 02:22:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSuWxOPCTPA9U8IMDGIMh/VKkKZhEwBkJplnf4pyu0xHwKOkd85RRM5jJvLsysDJyWh+vTLX5H46uuVQ==@lists.infradead.org, AJvYcCW2XPFfL6AQ6D8jQ3GXqkcqzMKchbqd/IYaD/CfEs//XW11YcOoE/4F0wRiSJfDP+5tNn4UJT3vXEhFF2k=@lists.infradead.org, AJvYcCXeXX6K+gtsgkZGSwGEAn0ctOgbK59SMuZWp80CCBEk9Xnib3pb7Iidy2tOGIt/L78GDLFUNC5JYZk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwirEWcnk5lJxKnQXWwVDDu20TyPv85eMNGjMwGLV//jgGqodId
	Qzwz9Mj9uEtYoaxqqwarU3FR9x6IL5o6D9ikBL3pDUx4Kb//u60XGMSKmxzGsYubQ/RdJjEOBpq
	bl7x9XeqHCbZAsE91SZGsKZze4x8=
X-Google-Smtp-Source: AGHT+IF3jZFlaB+ZbNTy99aWKHRW0ahCYMSSdgm6iKEF0x/RcYEZFdBlnTMpJzR5i/QwTCeteoihHBZi+8MLpfxSmpw=
X-Received: by 2002:a05:6000:2a6:b0:391:20ef:6300 with SMTP id
 ffacd0b85a97d-3997f93962dmr16836387f8f.37.1742980974678; Wed, 26 Mar 2025
 02:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250325121624.523258-1-guoren@kernel.org> <20250325121624.523258-26-guoren@kernel.org>
 <05fec753-cdaa-45a5-a029-b6435c30eb07@omp.ru>
In-Reply-To: <05fec753-cdaa-45a5-a029-b6435c30eb07@omp.ru>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 26 Mar 2025 17:22:41 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQTfD3yVCePWi_Jxu6Vc878K4P-quy4ZKw1OOF0X30UwQ@mail.gmail.com>
X-Gm-Features: AQ5f1Joqx3oO-95jEhIdt3VHkcZ-PNWMEgaxjEOC2faFZmARHVgyLTPNu3C9X9I
Message-ID: <CAJF2gTQTfD3yVCePWi_Jxu6Vc878K4P-quy4ZKw1OOF0X30UwQ@mail.gmail.com>
Subject: Re: [RFC PATCH V3 25/43] rv64ilp32_abi: exec: Adapt 64lp64 env and argv
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, torvalds@linux-foundation.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, oleg@redhat.com, kees@kernel.org, tglx@linutronix.de, 
	will@kernel.org, mark.rutland@arm.com, brauner@kernel.org, 
	akpm@linux-foundation.org, rostedt@goodmis.org, edumazet@google.com, 
	unicorn_wang@outlook.com, inochiama@outlook.com, gaohan@iscas.ac.cn, 
	shihua@iscas.ac.cn, jiawei@iscas.ac.cn, wuwei2016@iscas.ac.cn, drew@pdp7.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, ctsai390@andestech.com, 
	wefu@redhat.com, kuba@kernel.org, pabeni@redhat.com, josef@toxicpanda.com, 
	dsterba@suse.com, mingo@redhat.com, peterz@infradead.org, 
	boqun.feng@gmail.com, xiao.w.wang@intel.com, qingfang.deng@siflower.com.cn, 
	leobras@redhat.com, jszhang@kernel.org, conor.dooley@microchip.com, 
	samuel.holland@sifive.com, yongxuan.wang@sifive.com, 
	luxu.kernel@bytedance.com, david@redhat.com, ruanjinjie@huawei.com, 
	cuiyunhui@bytedance.com, wangkefeng.wang@huawei.com, qiaozhe@iscas.ac.cn, 
	ardb@kernel.org, ast@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, bpf@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arch@vger.kernel.org, maple-tree@lists.infradead.org, 
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-atm-general@lists.sourceforge.net, linux-btrfs@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	linux-nfs@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org
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

T24gV2VkLCBNYXIgMjYsIDIwMjUgYXQgMToxOeKAr0FNIFNlcmdleSBTaHR5bHlvdiA8cy5zaHR5
bHlvdkBvbXAucnU+IHdyb3RlOgo+Cj4gT24gMy8yNS8yNSAzOjE2IFBNLCBndW9yZW5Aa2VybmVs
Lm9yZyB3cm90ZToKPgo+ID4gRnJvbTogIkd1byBSZW4gKEFsaWJhYmEgREFNTyBBY2FkZW15KSIg
PGd1b3JlbkBrZXJuZWwub3JnPgo+ID4KPiA+IFRoZSBydjY0aWxwMzIgYWJpIHJldXNlcyB0aGUg
ZW52IGFuZCBhcmd2IG1lbW9yeSBsYXlvdXQgb2YgdGhlCj4gPiBscDY0IGFiaSwgc28gbGVhdmUg
dGhlIHNwYWNlIHRvIGZpdCB0aGUgbHA2NCBzdHJ1Y3QgbGF5b3V0Lgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEd1byBSZW4gKEFsaWJhYmEgREFNTyBBY2FkZW15KSA8Z3VvcmVuQGtlcm5lbC5vcmc+
Cj4gPiAtLS0KPiA+ICBmcy9leGVjLmMgfCA0ICsrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2V4ZWMuYyBiL2ZzL2V4ZWMuYwo+
ID4gaW5kZXggNTA2Y2Q0MTFmNGFjLi41NDhkMThiN2FlOTIgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9l
eGVjLmMKPiA+ICsrKyBiL2ZzL2V4ZWMuYwo+ID4gQEAgLTQyNCw2ICs0MjQsMTAgQEAgc3RhdGlj
IGNvbnN0IGNoYXIgX191c2VyICpnZXRfdXNlcl9hcmdfcHRyKHN0cnVjdCB1c2VyX2FyZ19wdHIg
YXJndiwgaW50IG5yKQo+ID4gICAgICAgfQo+ID4gICNlbmRpZgo+ID4KPiA+ICsjaWYgZGVmaW5l
ZChDT05GSUdfNjRCSVQpICYmIChCSVRTX1BFUl9MT05HID09IDMyKQpva2F5LCAjaWYgZGVmaW5l
ZChDT05GSUdfNjRCSVQpICYmIEJJVFNfUEVSX0xPTkcgPT0gMzIKCj4KPiAgICBQYXJlbnMgZG9u
J3Qgc2VlbSBuZWNlc3NhcnkuLi4KPgo+ID4gKyAgICAgbnIgPSBuciAqIDI7Cj4KPiAgICBXaHkg
bm90IG5yICo9IDI/Cm9rYXksIG5yICo9IDI7CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgot
LSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
