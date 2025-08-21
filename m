Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1881CCA0EE6
	for <kvm-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 03:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjMbPnMrxrnpPzksmEnqSVu+1wHapOTWmBtbnLj7EpA=; b=Y2oBSz+4NQpTGN
	dRbvJ2d/3zGLgr3nHZ4N+pjN2q025k4yw3hPgEGL7ZxT6B1dZrKBo0K9RWLCq6RyW9Xvx9b2QJ2/+
	/NkRNfJJjYyMYHSKLmIzhw/EuMOq+BqWEpLr92vO/iR46GD5+2tOpRcnd8flaBz2PykKkNkzpAo/H
	plb1IZKE5c2TNlspG3hNuK8CVTKNBVrDwl3RM/BQeUW/VzBGhtaWBoqNilo6MM4qiOIR+xhiuEH3Y
	m0C68S1dNKTsrqjLYbNSoEtja9jWrRJzGGlRrH46umH+cb4GcKZfsADOD55vFF8z9eYKtsoN9WiY0
	2x0amQ3RdcvoSQNmPW4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow8A-0000000FeZ3-3RXa;
	Thu, 21 Aug 2025 03:38:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uou4C-0000000FRlz-2MPr;
	Thu, 21 Aug 2025 01:26:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 062F344D73;
	Thu, 21 Aug 2025 01:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA748C113D0;
	Thu, 21 Aug 2025 01:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755739571;
	bh=LnGSf8eZmzHDX4YDDFfdF9dk8w7H2oiMRfMTk8c1EfA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I8YE/1v+bejfpeH18NyslQeyZvi5Gm6qOWIV82ssje3PsZan9NQbRysM78XIgyZ84
	 e5yPLdyy637cXc+Mr5qBMbWeI7ej8RLjCrgxmj+gBPzqUYXbOsxxuP6G4+1E+0kLRL
	 BhY7ONBhjfKR4ToJaJry0S1Cqv7pgxPnm4OKLVV08uqE+s7MGtqBAlslBxHtF87olo
	 pWQf/CpL1FSAIvTevEzRs5ISS/llcboVq/tUhX8gCUct1ufogWrklFDkSUVNmEbcvT
	 4WXIf0Lz2iuEeptqfA1DnFwBVk7cjCrAkrKZqlMhtUF1t+yjpP1VyfjyN040l0Ni8k
	 qglLM3+jGzn1Q==
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a286135c8so8014545e9.0;
        Wed, 20 Aug 2025 18:26:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBa36eUZ0b7aeugGnyDlB2vAIP7fbTtMrs6SkKxmJpDEPVjEz8Wo4fnNSOTLyVr4KaGdary04vkHQ=@lists.infradead.org, AJvYcCXpZfW2qlCpDxYrcx/TZth62VdU3ZAKItuT+xWqplJyvoGA+ToxjJe7wpKE1xYjUJl7ra7g+5qfpG6uXxQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQJ1NGojM9fKtUKm7kFO30fm90dnF/tSSXNa5gSX1gS3IuwrGe
	fBoqytUzKNYOyUpHZzhWGO2syABIk6MaINuFUmYXxYSYKX48Zk4shNJuYDlDYb7iVMGg16UX2Ff
	BX1q6xpY3qzWbjsE+9iAjLZIT6yZrUp4=
X-Google-Smtp-Source: AGHT+IGGICOecBkmHwgRKDE56lZRP6wcugcHJo0gEL4zRiu7fL+DOBskg/CVonknskbdGs/GTh/1B8yqRjR156fE548=
X-Received: by 2002:a05:6000:24c3:b0:3b7:590d:ac7d with SMTP id
 ffacd0b85a97d-3c4b4256002mr256638f8f.1.1755739570486; Wed, 20 Aug 2025
 18:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250820125952.71689-1-fangyu.yu@linux.alibaba.com>
 <20250820125952.71689-3-fangyu.yu@linux.alibaba.com> <aKXeXd4pZvoQmYB9@troy-wujie14pro-arch>
In-Reply-To: <aKXeXd4pZvoQmYB9@troy-wujie14pro-arch>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 21 Aug 2025 09:25:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRR0LTO-CbUMkyXisov3BeftN+UJzv99GX7KfqCxWxmUg@mail.gmail.com>
X-Gm-Features: Ac12FXxvAMsRQPy1tVyPjpoJutYOXESvM1svIIzMRusXPOnriqM8rsnzuEUEwNg
Message-ID: <CAJF2gTRR0LTO-CbUMkyXisov3BeftN+UJzv99GX7KfqCxWxmUg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] RISC-V KVM: Remove unnecessary HGATP csr_read
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: fangyu.yu@linux.alibaba.com, anup@brainfault.org, atish.patra@linux.dev, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_182612_641255_58568BE8 
X-CRM114-Status: GOOD (  22.80  )
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

T24gV2VkLCBBdWcgMjAsIDIwMjUgYXQgMTA6NDDigK9QTSBUcm95IE1pdGNoZWxsIDx0cm95Lm1p
dGNoZWxsQGxpbnV4LmRldj4gd3JvdGU6Cj4KPiBPbiBXZWQsIEF1ZyAyMCwgMjAyNSBhdCAwODo1
OTo1MlBNICswODAwLCBmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20gd3JvdGU6Cj4gPiBGcm9t
OiAiR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRlbXkpIiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4g
Pgo+ID4gVGhlIEhHQVRQIGhhcyBiZWVuIHNldCB0byB6ZXJvIGluIGdzdGFnZV9tb2RlX2RldGVj
dCgpLCBzbyB0aGVyZQo+ID4gaXMgbm8gbmVlZCB0byBzYXZlIHRoZSBvbGQgY29udGV4dC4gVW5p
ZnkgdGhlIGNvZGUgY29udmVudGlvbgo+ID4gd2l0aCBnc3RhZ2VfbW9kZV9kZXRlY3QoKS4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIChBbGliYWJhIERBTU8gQWNhZGVteSkgPGd1b3Jl
bkBrZXJuZWwub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGlu
dXguYWxpYmFiYS5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2t2bS92bWlkLmMgfCA1ICst
LS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92bWlkLmMgYi9hcmNoL3Jpc2N2L2t2
bS92bWlkLmMKPiA+IGluZGV4IDVmMzM2MjVmNDA3MC4uYWJiMWMyYmYyNTQyIDEwMDY0NAo+ID4g
LS0tIGEvYXJjaC9yaXNjdi9rdm0vdm1pZC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92bWlk
LmMKPiA+IEBAIC0yNSwxNSArMjUsMTIgQEAgc3RhdGljIERFRklORV9TUElOTE9DSyh2bWlkX2xv
Y2spOwo+ID4KPiA+ICB2b2lkIF9faW5pdCBrdm1fcmlzY3ZfZ3N0YWdlX3ZtaWRfZGV0ZWN0KHZv
aWQpCj4gPiAgewo+ID4gLSAgICAgdW5zaWduZWQgbG9uZyBvbGQ7Cj4gPiAtCj4gPiAgICAgICAv
KiBGaWd1cmUtb3V0IG51bWJlciBvZiBWTUlEIGJpdHMgaW4gSFcgKi8KPiA+IC0gICAgIG9sZCA9
IGNzcl9yZWFkKENTUl9IR0FUUCk7Cj4gPiAgICAgICBjc3Jfd3JpdGUoQ1NSX0hHQVRQLCAoa3Zt
X3Jpc2N2X2dzdGFnZV9tb2RlIDw8IEhHQVRQX01PREVfU0hJRlQpIHwgSEdBVFBfVk1JRCk7Cj4g
PiAgICAgICB2bWlkX2JpdHMgPSBjc3JfcmVhZChDU1JfSEdBVFApOwo+ID4gICAgICAgdm1pZF9i
aXRzID0gKHZtaWRfYml0cyAmIEhHQVRQX1ZNSUQpID4+IEhHQVRQX1ZNSURfU0hJRlQ7Cj4gPiAg
ICAgICB2bWlkX2JpdHMgPSBmbHNfbG9uZyh2bWlkX2JpdHMpOwo+ID4gLSAgICAgY3NyX3dyaXRl
KENTUl9IR0FUUCwgb2xkKTsKPiA+ICsgICAgIGNzcl93cml0ZShDU1JfSEdBVFAsIDApOwo+IElz
IHNldHRpbmcgSEdBVFAgdG8gMCBpbiBnc3RhZ2VfbW9kZV9kZXRlY3QgbWVhbmluZ2xlc3Mgbm93
Pwo+IElmIHNvLCBpdCBtaWdodCBiZSBiZXR0ZXIgdG8gZHJvcCBpdCBhbmQganVzdCBrZWVwIHRo
ZSBvbmUgaGVyZS4KU29ycnksIEkgbWlzdW5kZXJzdG9vZCBoZXJlLgoKMS4ga3ZtX3Jpc2N2X2dz
dGFnZV92bWlkX2RldGVjdCgpICYgZ3N0YWdlX21vZGVfZGV0ZWN0KCkgYXJlIGluZGVwZW50CmZ1
bmN0aW9uLCBzbyBrZWVwIGNzcl93cml0ZShDU1JfSEdBVFAsIDApIGlzIGNvbnNpZGVyYWJsZS4K
CjIuIEJ1dCB5b3VyIGlkZWEgaXMgZ29vZCwgYmVjYXVzZSBjc3Jfd3JpdGUoQ1NSX0hHQVRQLCAw
KSB3b3VsZCBjYXVzZQpUTEIgZmx1c2ggaW4gc29tZSBtaWNyby1hcmNoLCB3aGljaCByZWR1Y2Vz
IHRoZSBJUEMuIFNvLCByZW1vdmluZwp1bm5lY2Vzc2FyeSBDU1Jfd3JpdGUgKENTUl9IR0FUUCwg
MCkgaXMgYWxzbyBjb25zaWRlcmFibGUuCgpJIHdvdWxkIHVwZGF0ZSBWNCB0byBtZXJnZSBrdm1f
cmlzY3ZfZ3N0YWdlX3ZtaWRfZGV0ZWN0KCkgJgpnc3RhZ2VfbW9kZV9kZXRlY3QoKSBpbnRvIGEg
c2luZ2xlIGZ1bmN0aW9uLCBpbnNwaXJlZCBieSB5b3VyIGlkZWEuCgo+Cj4gICAgICAgICAgICAg
ICAgIC0gVHJveQo+Cj4gPgo+ID4gICAgICAgLyogV2UgcG9sbHV0ZWQgbG9jYWwgVExCIHNvIGZs
dXNoIGFsbCBndWVzdCBUTEIgKi8KPiA+ICAgICAgIGt2bV9yaXNjdl9sb2NhbF9oZmVuY2VfZ3Zt
YV9hbGwoKTsKPiA+IC0tCj4gPiAyLjQ5LjAKPiA+Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dAo+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCgotLSAKQmVzdCBSZWdh
cmRzCiBHdW8gUmVuCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2t2bS1yaXNjdgo=
