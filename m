Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2294C3600D
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 06:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0VY/sZAI3wfvRczRFGF7mNSbSAAb9leA9KU/3L2//9k=; b=C9CL5M6is1GTN6
	7P/71pEbuBtr6Pwv2v87U+JfGj7xm273CtSjPr54Cyli4PMbpSgC7FL+xNfQSlww6NHw6L1DX5hqG
	A/Ff1kjZyAjhtDlzMWmqTmFqDYJm3wQ9bA3mwAWNCrSK7Oi0X/MKpgSk3aL9QlY+7MzDYQOdWt6wF
	V6EcGIhJEqMlFBNpvnrHaSkw9sBuJJmeuUvZMr8T5I7+UPX3RQmeRNWG6goacdxSfoOgm5JOw+0tN
	IExK43RLpRtKauJ9AS0njkR4TLFll0fx0RzwDlMj8ysfF39/JBl2/l9N1unV2PqAfMp+SJCq8G3Wr
	uaHfLyDGK9IshQvqysNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKN4-00000007ftx-28ON;
	Wed, 26 Mar 2025 06:36:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKLi-00000007fgN-2P5K;
	Wed, 26 Mar 2025 06:34:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 22F0CA40A9B;
	Wed, 26 Mar 2025 06:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80F3C19422;
	Wed, 26 Mar 2025 06:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742970888;
	bh=2MGPnAtzDlcfNFkgrjhcbs+PSZK/71xFqiqfm4ICurw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oqWCSEWgqSzuZihIGSGxBq/NFjOUhZjOlwZMMZY+/2ybNPO86h100+06K+NuCc9Mt
	 WYnoiWB1I5d60B7CRE6XuosOocePqX6eDdBEP/8SE+DYlhSfcxkLZF9LrlQ68Y4veL
	 H8xWmZsln8RTeTMzlPXP6pl8crUOBBsMQcncsHm3UJYg5K3kU3IXi4FH/Qc4qv2wOO
	 yEJnquI42uVFFeIsvvRh3GMWQ+sFTb7U/WMNtlSVXjGbMeRckEm9GTcI5P7A0b/Ro3
	 nMSrwoZKByN/PZoX2e4Jn/Y5mLcclU97Oe6eskkQTsOcmnMnijIJvWokjpBxxC2uqF
	 n5hVyTRxxXDfw==
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3913d45a148so5217720f8f.3;
        Tue, 25 Mar 2025 23:34:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkYEBB3P6rFEimArWfYgfPpbV/yNU2oQxA53gKFS4Xb/+l6i/4wjWMtkxbgGeJSXVVwGFxfQKVfsHGvws=@lists.infradead.org, AJvYcCXBPa/2d3lvuBaB2xIJ4YJVRYehYDiwyHHBIlW+SjiIdCfcWLAXLGTpedkNukftMJVD+A6Mmg5+zjDsWQ==@lists.infradead.org, AJvYcCXS1cA+ugkPNwVz4GKPcS2/ClaO+oGAIE606PYzE/FvHFw5j/aDVf5By74vyQs+UINzA08ifJogRPc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQqtmOtn2pi+hwSeShAGt5MKPg/MEIKgZX+wqn9qPv+c1sY6oJ
	6uEWFGjDBP5ZI2jPhb+v47eIY7yccTbKt/neYS0g6SrAM5BgYSjTsfpZ1LWow9yj+yV0QYgGg1e
	hVwYmLBJP4T06HTbBYZR407nvYWQ=
X-Google-Smtp-Source: AGHT+IGIApydo9VgmdhIDcmOnmG1sSv1FEEmzeINRVbJ26tbvLOq+REJlE+tfl+WofDYebAF8b+RY6kbO+n3ISps8p8=
X-Received: by 2002:a5d:47c6:0:b0:38d:d371:e04d with SMTP id
 ffacd0b85a97d-3997f937cd7mr16526330f8f.34.1742970886849; Tue, 25 Mar 2025
 23:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250325121624.523258-1-guoren@kernel.org> <20250325121624.523258-2-guoren@kernel.org>
 <CAHk-=wiVgTJpSxrQbEi28pUOmuWXrox45vV9kPhe9q5CcRxEbw@mail.gmail.com>
In-Reply-To: <CAHk-=wiVgTJpSxrQbEi28pUOmuWXrox45vV9kPhe9q5CcRxEbw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 26 Mar 2025 14:34:32 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRZyAAgrM1RMrTi7Zi+Vx_VBnM1=CWwZZtLy+uHZ=vZpw@mail.gmail.com>
X-Gm-Features: AQ5f1JpGXhmRPDvCQOc_Kwk_PFeqm824JtKAYEkQji0TkGjMeyznsoqjkxAkPig
Message-ID: <CAJF2gTRZyAAgrM1RMrTi7Zi+Vx_VBnM1=CWwZZtLy+uHZ=vZpw@mail.gmail.com>
Subject: Re: [RFC PATCH V3 01/43] rv64ilp32_abi: uapi: Reuse lp64 ABI interface
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org, 
	oleg@redhat.com, kees@kernel.org, tglx@linutronix.de, will@kernel.org, 
	mark.rutland@arm.com, brauner@kernel.org, akpm@linux-foundation.org, 
	rostedt@goodmis.org, edumazet@google.com, unicorn_wang@outlook.com, 
	inochiama@outlook.com, gaohan@iscas.ac.cn, shihua@iscas.ac.cn, 
	jiawei@iscas.ac.cn, wuwei2016@iscas.ac.cn, drew@pdp7.com, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_233450_753291_BFFEFB57 
X-CRM114-Status: GOOD (  24.30  )
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

T24gV2VkLCBNYXIgMjYsIDIwMjUgYXQgNDo0MeKAr0FNIExpbnVzIFRvcnZhbGRzCjx0b3J2YWxk
c0BsaW51eC1mb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIDI1IE1hciAyMDI1IGF0
IDA1OjE3LCA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFRoZSBydjY0aWxwMzIg
YWJpIGtlcm5lbCBhY2NvbW1vZGF0ZXMgdGhlIGxwNjQgYWJpIHVzZXJzcGFjZSBhbmQKPiA+IGxl
dmVyYWdlcyB0aGUgbHA2NCBhYmkgTGludXggaW50ZXJmYWNlLiBIZW5jZSwgdW5pZnkgdGhlCj4g
PiBCSVRTX1BFUl9MT05HID0gMzIgbWVtb3J5IGxheW91dCB0byBtYXRjaCBCSVRTX1BFUl9MT05H
ID0gNjQuCj4KPiBOby4KPgo+IFRoaXMgaXNuJ3QgaGFwcGVuaW5nLgo+Cj4gWW91IGNhbid0IGRv
IGNyYXp5IHRoaW5ncyBpbiB0aGUgUklTQy1WIGNvZGUgYW5kIHRoZW4gZXhwZWN0IHRoZSByZXN0
Cj4gb2YgdGhlIGtlcm5lbCB0byBqdXN0IGdvICJvaywgd2UnbGwgZG8gY3JhenkgdGhpbmdzIi4K
Pgo+IFdlJ3JlIG5vdCBkb2luZyBjcmF6eSBfX3Jpc2N2X3hsZW4gaGFja2VyeSB3aXRoIHJhbmRv
bSBzdHJ1Y3R1cmVzCj4gY29udGFpbmluZyA2NC1iaXQgdmFsdWVzIHRoYXQgdGhlIGtlcm5lbCB0
aGVuIG9ubHkgbG9va3MgYXQgdGhlIGxvdyAzMgo+IGJpdHMuIFRoYXQncyB3cm9uZyBvbiAqc28q
IG1hbnkgbGV2ZWxzLgo+Cj4gSSdtIHdpbGxpbmcgdG8gc2F5ICJiaWctZW5kaWFuIGlzIGRlYWQi
LCBidXQgSSdtIG5vdCB3aWxsaW5nIHRvIGFjY2VwdAo+IHRoaXMga2luZCBvZiBjcmF6eSBoYWNr
ZXJ5Lgo+Cj4gTm90IHRvZGF5LCBub3QgZXZlci4KPgo+IElmIHlvdSB3YW50IHRvIHJ1biBhIGls
cDMyIGtlcm5lbCBvbiA2NC1iaXQgaGFyZHdhcmUgKGFuZCBzdXBwb3J0Cj4gNjQtYml0IEFCSSBq
dXN0IGluIGEgMzItYml0IHZpcnR1YWwgbWVtb3J5IHNpemUpLCBJIHdvdWxkIHN1Z2dlc3QgeW91
Cj4KPiAgKGEpIHRyZWF0IHRoZSBrZXJuZWwgYXMgbmF0aXZlbHkgMzItYml0IChvYnZpb3VzbHkg
eW91IGNhbiB0aGVuIHRlbGwKPiB0aGUgY29tcGlsZXIgdG8gdXNlIHRoZSBydjY0IGluc3RydWN0
aW9ucywgd2hpY2ggSSBwcmVzdW1lIHlvdSdyZQo+IGFscmVhZHkgZG9pbmcgLSBJIGRpZG4ndCBs
b29rKQpJIHVzZWQgQ09ORklHXzMyQklUIGluIHYxIGFuZCB2MiwgYnV0IEkndmUgYWJhbmRvbmVk
IHRoZW0gYmVjYXVzZSwKYmFzZWQgb24gQ09ORklHXzY0QklULCBJIGdhaW4gbW9yZSBmdW5jdGlv
bmFsaXR5IGJ5IGluaGVyaXRpbmcgdGhlCmxwNjQtYWJpIGtlcm5lbC4gSSB3YW50IHRoZSBmdWxs
IGZ1bmN0aW9uYWxpdHkgb2YgdGhlIENPTkZJR182NEJJVApMaW51eCBrZXJuZWwsIHdoaWNoIGNh
biBiZSBlcXVpdmFsZW50LCB1c2VkIGludGVyY2hhbmdlYWJseSwgYW5kCnNlYW1sZXNzbHkuCgo+
Cj4gIChiKSBsb29rIGF0IG1ha2luZyB0aGUgY29tcGF0IHN0dWZmIGRvIHRoZSBjb252ZXJzaW9u
IHRoZSAid3Jvbmcgd2F5Ii4KPgo+IEFuZCBidHcsIHRoYXQgKGIpIGltcGxpZXMgKm5vdCoganVz
dCBpZ25vcmluZyB0aGUgaGlnaCBiaXRzLiBJZgo+IHVzZXItc3BhY2UgZ2l2ZXMgNjQtYml0IHBv
aW50ZXIsIHlvdSBkb24ndCBqdXN0IHRyZWF0IGl0IGFzIGEgMzItYml0Cj4gb25lIGJ5IGRyb3Bw
aW5nIHRoZSBoaWdoIGJpdHMuIFlvdSBhZGQgc29tZSBsb2dpYyB0byBjb252ZXJ0IGl0IHRvIGFu
Cj4gaW52YWxpZCBwb2ludGVyIHNvIHRoYXQgdXNlciBzcGFjZSBnZXRzIC1FRkFVTFQuClRoYW5r
cyBmb3IgdGhlIGFkdmljZS4gSSdtIGxvb2tpbmcgYXQgaG93IHRvIG1ha2UgdGhlIGNvbXBhdCBz
dHVmZi4KCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBs
aXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
