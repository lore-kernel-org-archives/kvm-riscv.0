Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE43C3600B
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 13:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/PpJWfByZzR9bywAWkgSLIwk9P/sRbAfmOmgK59BYw=; b=dfsofxDfTQBB4v
	IIZOK39rNNERQYYpQp1VC7PpkiYd9IU2da0yfuHxqUw8edxMrscsyFbTMvEix2sICBmGXzViJHm5L
	KVSwgK5+1U9Gvru3EQ42hDQXeYMdfw2YeQ8T5zFyjVvWISxv2/PA9FWPGBiO3b+s6Y5zwRThNzioF
	S4hDZn4iIsHQjHiYC3MB30tcHQoRdwqHEAXjNJsahJeF3MyNRDH+3AXsJ5S1wDtKaHtcX04GMgT42
	LwMnXTy2rOvq8n72ZbAMiFI95U2RoTk6wvS28ayAi7BweYXmKXQXj74RWnlupn/2zPO0meuXKe1nZ
	zZM0lHxPCzwVxSvjcOGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txnFP-0000000B45g-1XPu;
	Thu, 27 Mar 2025 13:26:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txn3V-0000000B2Ms-2jBq;
	Thu, 27 Mar 2025 13:13:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF4F344B3E;
	Thu, 27 Mar 2025 13:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1EDC4CEF8;
	Thu, 27 Mar 2025 13:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743081236;
	bh=fKz9pnQ+RHCIb1EIYOpjNQk9UHkPlQZ8YelVCnzImCE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rucCoEpKD2uKA82npuUHc2IlG2oWnwqgT8U9tN8DMOP4U1dwkgyyYXgAIKPFMuNMW
	 Mr/rysi/pjy41dJOAzljBbZzg72+mfpEOGGzhjDTx6c9rxCGjmC5SMyEbWJ2N0+oWF
	 Xl99PlkGVupFWkqkqPnK/n7IH270nzZea0M/gmSRDQXN9qd9osa7eI+CFXdg5DLHuu
	 1M2pbO4Lh5olO8JonWgiuDrCf/0OvRFMkhALjgLziXzN6dyFchrENnGietvVrKXS4A
	 SEpLCltJiXG4chUafZNqd/4THrfGNnJIQszxbPkTKIenmMOlkgpgrOYysOf2geIYRL
	 xyGI4KognAkFg==
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3912baafc58so711441f8f.1;
        Thu, 27 Mar 2025 06:13:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhTMmjgdrf17YrpBUeQGdToA9wRDS6A0Rcmc2HNI3wmdrylxvHl1Jp/LLdxwSSgWtpWAG5VGvIi7GOHQ==@lists.infradead.org, AJvYcCWOvbZpO3zMNviwcs7Avh4d/s2VvhzenLrjpJah4sRMmheolgZWEh1UBnXWBNN2JtPovvldXUBMR4s=@lists.infradead.org, AJvYcCXQyoJMqmO+72BNXZqeXUzf2zktPfBNvEoeAEDEwP5lHS6hmhW3o/aYwF8eRp0rWL/CA/3grCQ8tHo711E=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJK1BIc5N1Z2ZKi65I2fkbLoU6ppXFYmN2/rYUVcSLQ/hn/xdh
	lzXlIKBZ9/D3PoYm8GWeYUev7xvuSpmdKHyAGcItUGgIL7ITzv9KW0kx6jpb+iTtIgRPw3tslPO
	3bW1MoLXcrtEQ5F3whnxoo5yUaiE=
X-Google-Smtp-Source: AGHT+IEY5BSiBwNXEMT+eJeprlWhvYaVjud2VavXTPTPRvbe/6IFqzcZmwQqb+uo+KChSyUJAdyAvfkgwaIRQv6W9xk=
X-Received: by 2002:a05:6000:1ace:b0:391:29f:4f70 with SMTP id
 ffacd0b85a97d-39ad17544e8mr3039357f8f.3.1743081235006; Thu, 27 Mar 2025
 06:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250325121624.523258-1-guoren@kernel.org> <20250325122640.GK36322@noisy.programming.kicks-ass.net>
 <db3c9923-8800-4ed3-a352-4ee9ef79c0b7@app.fastmail.com> <CAJF2gTSHpZMyUk+8HL0=bevCd4XZYRAkrPM600qLPCKxG+bfrg@mail.gmail.com>
 <a9dddc3d-d03d-4614-9d55-1ce48c6ad5ef@app.fastmail.com>
In-Reply-To: <a9dddc3d-d03d-4614-9d55-1ce48c6ad5ef@app.fastmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 27 Mar 2025 21:13:43 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQtdKzq2Qc6s2qQs3pwMS79Re3vRY735kLM31qNFQD=rg@mail.gmail.com>
X-Gm-Features: AQ5f1JrgAJHOCdrriP16_V_QmEg1YQ85TRRC6Mrmapp2zXhvmV1mwcc9X_F3CrI
Message-ID: <CAJF2gTQtdKzq2Qc6s2qQs3pwMS79Re3vRY735kLM31qNFQD=rg@mail.gmail.com>
Subject: Re: [RFC PATCH V3 00/43] rv64ilp32_abi: Build CONFIG_64BIT
 kernel-self with ILP32 ABI
To: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Christian Brauner <brauner@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Eric Dumazet <edumazet@google.com>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, gaohan@iscas.ac.cn, shihua@iscas.ac.cn, 
	jiawei@iscas.ac.cn, wuwei2016@iscas.ac.cn, Drew Fustini <drew@pdp7.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, ctsai390@andestech.com, 
	wefu@redhat.com, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Ingo Molnar <mingo@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Xiao W Wang <xiao.w.wang@intel.com>, 
	qingfang.deng@siflower.com.cn, Leonardo Bras <leobras@redhat.com>, 
	Jisheng Zhang <jszhang@kernel.org>, "Conor.Dooley" <conor.dooley@microchip.com>, 
	Samuel Holland <samuel.holland@sifive.com>, yongxuan.wang@sifive.com, 
	Xu Lu <luxu.kernel@bytedance.com>, David Hildenbrand <david@redhat.com>, 
	Ruan Jinjie <ruanjinjie@huawei.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, qiaozhe@iscas.ac.cn, 
	Ard Biesheuvel <ardb@kernel.org>, Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, bpf@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, maple-tree@lists.infradead.org, 
	linux-trace-kernel@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
	linux-atm-general@lists.sourceforge.net, linux-btrfs@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	linux-nfs@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_061357_734549_46F7F399 
X-CRM114-Status: GOOD (  52.57  )
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

T24gV2VkLCBNYXIgMjYsIDIwMjUgYXQgMjo1NuKAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXIgMjYsIDIwMjUsIGF0IDA3OjA3LCBHdW8gUmVu
IHdyb3RlOgo+ID4gT24gVHVlLCBNYXIgMjUsIDIwMjUgYXQgOToxOOKAr1BNIEFybmQgQmVyZ21h
bm4gPGFybmRAYXJuZGIuZGU+IHdyb3RlOgo+ID4+IE9uIFR1ZSwgTWFyIDI1LCAyMDI1LCBhdCAx
MzoyNiwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gPj4gPiBPbiBUdWUsIE1hciAyNSwgMjAyNSBh
dCAwODoxNTo0MUFNIC0wNDAwLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+Pgo+ID4+IFlv
dSBkZWNsYXJlIHRoZSBzeXNjYWxsIEFCSSB0byBiZSB0aGUgbmF0aXZlIDY0LWJpdCBBQkksIGJ1
dCB0aGlzCj4gPj4gaXMgZnVuZGFtZW50YWxseSBub3QgdHJ1ZSBiZWNhdXNlIGEgbWFueSB1YXBp
IHN0cnVjdHVyZXMgYXJlCj4gPj4gZGVmaW5lZCBpbiB0ZXJtcyBvZiAnbG9uZycgb3IgcG9pbnRl
ciB2YWx1ZXMsIGluIHBhcnRpY3VsYXIgaW4KPiA+PiB0aGUgaW9jdGwgY2FsbC4KPiA+Cj4gPiBJ
IG1vZGlmaWVkIHVhcGkgd2l0aAo+ID4gdm9pZCBfX3VzZXIgKm1zZ19uYW1lOwo+ID4gLT4KPiA+
IHVuaW9uIHt2b2lkIF9fdXNlciAqbXNnX25hbWU7IHU2NCBfX21zZ19uYW1lO307Cj4gPiB0byBt
YWtlIG5hdGl2ZSA2NC1iaXQgQUJJLgo+ID4KPiA+IEkgd291bGQgbG9vayBhdCBjb21wYXQgc3R1
ZmYgaW5zdGVhZCBvZiB1c2luZyBfX3Jpc2N2X3hsZW4gbWFjcm8uCj4KPiBUaGUgcHJvYmxlbSBJ
IHNlZSBoZXJlIGlzIHRoYXQgdGhlcmUgYXJlIG1hbnkgbW9yZSBkcml2ZXJzCj4gdGhhdCB5b3Ug
ZGlkIG5vdCBtb2RpZnkgdGhhbiBkcml2ZXJzIHRoYXQgeW91IGRpZCBjaGFuZ2UgdGhpcwo+IHdh
eS4gIFRoZSB1bmlvbiBpcyBwYXJ0aWN1bGFybHkgdWdseSwgYnV0IGV2ZW4gaWYgeW91IGZpbmQK
PiBhIG5pY2VyIG1ldGhvZCBvZiBkb2luZyB0aGlzLCB5b3Ugbm93IGFsc28gcHV0IHRoZSBidXJk
ZW4KPiBvbiBmdXR1cmUgZHJpdmVyIHdyaXRlcnMgdG8gZG8gdGhpcyByaWdodCBmb3IgeW91ciBw
bGF0Zm9ybS4KR290IGl0LgoKPgo+ID4+IEFzIGZhciBhcyBJIGNhbiB0ZWxsLCB0aGVyZSBpcyBu
byB3YXkgdG8gcmVjdGlmeSB0aGlzIGRlc2lnbiBmbGF3Cj4gPj4gb3RoZXIgdGhhbiB0byBkcm9w
IHN1cHBvcnQgZm9yIDY0LWJpdCB1c2Vyc3BhY2UgYW5kIG9ubHkgc3VwcG9ydAo+ID4+IHJlZ3Vs
YXIgcnYzMiB1c2Vyc3BhY2UuIEknbSBhbHNvIHNrZXB0aWNhbCB0aGF0IHN1cHBvcnRpbmcgcnY2
NAo+ID4+IHVzZXJzcGFjZSBoZWxwcyBpbiBwcmFjdGljZSBvdGhlciB0aGFuIGZvciB0ZXN0aW5n
LCBzaW5jZQo+ID4+IGdlbmVyYWxseSBtb3N0IG1lbW9yeSBvdmVyaGVhZCBpcyBpbiB1c2Vyc3Bh
Y2UgcmF0aGVyIHRoYW4gdGhlCj4gPj4ga2VybmVsLCBhbmQgdGhlcmUgaXMgbXVjaCBtb3JlIHRv
IGdhaW4gZnJvbSBzaHJpbmtpbmcgdGhlIGxhcmdlcgo+ID4+IHVzZXJzcGFjZSBieSBydW5uaW5n
IHJ2MzIgY29tcGF0IG1vZGUgYmluYXJpZXMgb24gYSA2NC1iaXQga2VybmVsCj4gPj4gdGhhbiB0
aGUgb3RoZXIgd2F5IHJvdW5kLgo+ID4KPiA+IFRoZSBscDY0LWFiaSB1c2Vyc3BhY2Ugcm9vdGZz
IHdvcmtzIGZpbmUgaW4gdGhpcyBwYXRjaCBzZXQsIHdoaWNoCj4gPiBwcm92ZXMgdGhlIHRlY2hu
aXF1ZSBpcyB2YWxpZC4gQnV0IHRoZSBtb2RpZmljYXRpb24gb24gdWFwaSBpcyByYXcsCj4gPiBh
bmQgSSdtIGxvb2tpbmcgYXQgY29tcGF0IHN0dWZmLgo+Cj4gVGhlcmUgaXMgYSBiaWcgZGlmZmVy
ZW5jZSBiZXR3ZWVuIG1ha2luZyBpdCB3b3JrIGZvciBhIHBhcnRpY3VsYXIKPiBzZXQgb2YgdXNl
cnNwYWNlIGJpbmFyaWVzIGFuZCBtYWtpbmcgaXQgY29ycmVjdCBmb3IgdGhlIGVudGlyZQo+IGtl
cm5lbCBBQkkuCj4KPiBJIGFncmVlIHRoYXQgbGltaXRpbmcgdGhlIGhhY2tzIHRvIHRoZSBjb21w
YXQgc2lkZSB3aGlsZSBrZWVwaW5nCj4gdGhlIG5hdGl2ZSBBQkkgYXMgaWxwMzIgYXMgaW4geW91
ciBwcmV2aW91cyB2ZXJzaW9ucyBpcyBiZXR0ZXIsCj4gYnV0IEkgYWxzbyBkb24ndCB0aGluayB0
aGlzIGNhbiBiZSBlYXNpbHkgZG9uZSB3aXRob3V0IG1ham9yCj4gY2hhbmdlcyB0byBob3cgY29t
cGF0IG1vZGUgd29ya3MgaW4gZ2VuZXJhbCwgYW5kIHRoYXQgc3RpbGwKPiBzZWVtcyBsaWtlIGEg
c2hvdy1zdG9wcGVyIGZvciB0d28gcmVhc29uczoKPgo+IC0gaXQgc3RpbGwgcHV0cyB0aGUgYnVy
ZGVuIG9uIGRyaXZlciB3cml0ZXJzIHRvIGdldCBpdCByaWdodAo+ICAgZm9yIHlvdXIgcGxhdGZv
cm0uIFRoZSBzY29wZSBpcyBhIGJpdCBzbWFsbGVyIHRoYW4gaW4gdGhlCj4gICBjdXJyZW50IHZl
cnNpb24gYmVjYXVzZSB0aGF0IHdvdWxkIGJlIGxpbWl0ZWQgdG8gdGhlIGNvbXBhdAo+ICAgaGFu
ZGxlcnMgYW5kIG5vdCBjaGFuZ2UgdGhlIG5hdGl2ZSBjb2RlcGF0aCwgYnV0IHRoYXQncwo+ICAg
c3RpbGwgYSBsb3Qgb2YgZHJpdmVycy4KPgo+IC0gdGhlIHdheSB0aGF0IEkgd291bGQgaW1hZ2lu
ZSB0aGlzIHRvIGJlIGltcGxlbWVudGVkIGluCj4gICBwcmFjdGljZSB3b3VsZCByZXF1aXJlIGNo
YW5naW5nIHRoZSBjb21wYXQgY29kZSBpbiBhIHdheSB0aGF0Cj4gICBhbGxvd3MgbXVsdGlwbGUg
Y29tcGF0IEFCSXMsIHNvIGRyaXZlcnMgY2FuIHNlcGFyYXRlIHRoZQo+ICAgbm9ybWFsIDMyLW9u
LTY0IGhhbmRsaW5nIGZyb20gdGhlIDY0LW9uLTMyIHZlcnNpb24geW91IG5lZWQuCj4gICBXZSBo
YXZlIGRpc2N1c3NlZCBzb21ldGhpbmcgbGlrZSB0aGlzIGluIHRoZSBwYXN0LCBidXQgTGludXMK
PiAgIGhhcyBhbHJlYWR5IG1hZGUgaXQgdmVyeSBjbGVhciB0aGF0IGhlIGRvZXNuJ3Qgd2FudCBp
dCBkb25lCj4gICB0aGF0IHdheS4gV2hpY2hldmVyIHdheSB5b3UgZG8gaXQsIHRoaXMgaXMgdW5s
aWtlbHkgdG8KPiAgIGZpbmQgY29uc2Vuc3VzLgpHb3QgaXQsIHRoYW5rcyBmb3IgYW5hbHlzaW5n
LgoKPgo+ID4gU3VwcG9ydGluZyBscDY0LWFiaSB1c2Vyc3BhY2UgaXMgZXNzZW50aWFsIGJlY2F1
c2UgcmlzY3YgbHA2NC1hYmkgYW5kCj4gPiBpbHAzMi1hYmkgdXNlcnNwYWNlIGFyZSBoeWJyaWQg
ZGVwbG95bWVudHMgd2hlbiB0aGUgdGFyZ2V0IGlzCj4gPiBpbHAzMi1hYmkgdXNlcnNwYWNlLiBU
aGUgbHA2NC1hYmkgcHJvdmlkZXMgYSBnb29kIHN1cHBsZW1lbnQgdG8KPiA+IGlscDMyLWFiaSB3
aGljaCBlYXNlcyB0aGUgZGV2ZWxvcG1lbnQuCj4KPiBJJ20gbm90IGZvbGxvd2luZyBoZXJlLCBw
bGVhc2UgY2xhcmlmeS4gSSBkbyB1bmRlcnN0YW5kIHRoYXQKPiBoYXZpbmcgYSBtaXhlZCAzMi82
NCB1c2Vyc3BhY2UgY2FuIGhlbHAgZm9yIGRldmVsb3BtZW50LCBidXQKPiB0aGF0IGNhbiBhbHJl
YWR5IGJlIGRvbmUgb24gYSA2NC1iaXQga2VybmVsIGFuZCBpdCBkb2Vzbid0Cj4gc2VlbSB0byBi
ZSB1c2VmdWwgZm9yIGRlcGxveW1lbnQgYmVjYXVzZSBoYXZpbmcgdHdvIHNldHMgb2YKPiBzdXBw
b3J0IGxpYnJhcmllcyBtYWtlcyB0aGlzIGNvdW50ZXJwcm9kdWN0aXZlIGZvciB0aGUgZ29hbAo+
IG9mIHNhdmluZyBSQU0uCkluIG15IGNhc2UsIG1vc3QgYmluYXJpZXMgYW5kIGxpYnJhcmllcyBh
cmUgYmFzZWQgb24gMzItYml0LCBidXQgYQpzbWFsbCBwYXJ0IHdvdWxkIHJlbWFpbiBvbiA2NC1i
aXQsIHdoaWNoIG1heSBiZSBzdGF0aWNhbGx5IGxpbmtlZC4KRm9yIFJJU0MtViwgdGhlIHJ2NjQg
ZWNvc3lzdGVtIGlzIG1vcmUgY29tcGxldGUgdGhhbiB0aGUgcnYzMidzLiBTbywKcnY2NC1hYmkg
aXMgYWx3YXlzIG5lY2Vzc2FyeSwgYW5kIHJ2MzItYWJpIGlzIGEgc3VwcGxlbWVudC4KCj4KPiA+
PiBJZiB5b3UgcmVtb3ZlIHRoZSBDT05GSUdfNjRCSVQgY2hhbmdlcyB0aGF0IFBldGVyIG1lbnRp
b25lZCBhbmQKPiA+PiB0aGUgc3VwcG9ydCBmb3IgaWxwNjQgdXNlcmxhbmQgZnJvbSB5b3VyIHNl
cmllcywgeW91IGVuZCB1cAo+ID4+IHdpdGggYSBrZXJuZWwgdGhhdCBpcyB2ZXJ5IHNpbWlsYXIg
dG8gYSBuYXRpdmUgcnYzMiBrZXJuZWwKPiA+PiBidXQgZXhlY3V0ZXMgYXMgcnY2NGlscDMyIGFu
ZCBydW5zIHJ2MzIgdXNlcnNwYWNlLiBJIGRvbid0IGhhdmUKPiA+PiBhbnkgb2JqZWN0aW9ucyB0
byB0aGF0IGFwcHJvYWNoLCBhbmQgdGhlIHNhbWUgdGhpbmcgaGFzIGNvbWUKPiA+PiB1cCBvbiBh
cm02NCBhcyBhIHBvc3NpYmxlIGlkZWEgYXMgd2VsbCwgYnV0IEkgZG9uJ3Qga25vdyBpZgo+ID4+
IHRoYXQgYWN0dWFsbHkgYnJpbmdzIGFueSBub3RhYmxlIGFkdmFudGFnZSBvdmVyIGFuIHJ2MzIg
a2VybmVsLgo+ID4+Cj4gPj4gQXJlIHRoZXJlIENQVXMgdGhhdCBjYW4gcnVuIHJ2NjQga2VybmVs
cyBhbmQgcnYzMiB1c2Vyc3BhY2UKPiA+PiBidXQgbm90IHJ2MzIga2VybmVscywgc2ltaWxhciB0
byB3aGF0IHdlIGhhdmUgb24gQXJtIENvcnRleC1BNzYKPiA+PiBhbmQgQ29ydGV4LUE1MTA/Cj4g
Pgo+ID4gWWVzLCB0aGVyZSBpcywgYW5kIGl0IG9ubHkgc3VwcG9ydHMgcnYzMiB1c2Vyc3BhY2Us
IG5vdCBydjMyIGtlcm5lbC4KPiA+IGh0dHBzOi8vd3d3Lnhydm0uY29tL3Byb2R1Y3QveHVhbnRp
ZS9DOTA4Cj4KPiBPaywgdGhhbmtzIGZvciB0aGUgbGluay4KPgo+ICAgICAgICBBcm5kCj4KCgot
LSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
