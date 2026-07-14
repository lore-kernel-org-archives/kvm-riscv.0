Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B35EC44508
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 13:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6Ykc845q3vA4EM5L+PIE8dFEGKEpSae2Ny5lUjH0C4=; b=jp5L4AFbA9dbpb
	Yv0CecJexuaqdAGc2hfzvCQK3t9LDbHcgRvv1nkFFhAixmjnggYO12yx/bon2BtbgbLEpf3PvUBkK
	gz87lnXOnDYEmkVI9EGW840a1TTfV2fI5SjggxzyVvo3LWxQjTlpk6WLabe248eEYFURe2Kj5V+3Y
	9gjjgIrl8xTlH952FM/Dm8sQ8Lz9ctebTz+80YwxTTUyl2gSibgn/yDB+c8r2+zCS4v96jdiZcGmu
	nV2JDVk8DOJrOlswuB009QEApbkHhp2A+LRnFJa2TAqx2+5s3PDWcX+vUiDTYWUnKQqYWQ8uKAYb6
	riUoWwIXhFfOn/DjmcXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcph-0000000C5q9-02PC;
	Tue, 14 Jul 2026 13:05:57 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcpd-0000000C5mT-1nUI
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 13:05:55 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso4093996f8f.0
        for <kvm-riscv@lists.infradead.org>; Tue, 14 Jul 2026 06:05:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784034351; cv=none;
        d=google.com; s=arc-20260327;
        b=V4rPmmS6BbmE2J4RsR2IWBGQuH8TaaZqEzTWudDBLoiX/vS9wd+owHmE+zd+W/EVvx
         UXZQNvJawdZDOm9IF4k0MhvwqT4RARGN03/3XApIo5OUycH/C6ExdRnzqp1LpKuI6xew
         xExNG8IkDU/9rIFJEbEoJq4F+pb8R4M49zFy++Xri6DslnfAqzbPtJPYxtdg4LYTbBqi
         TIfiHZNZ3hpevzG9eDTmslp1fycK5ddLt9l3CThBaQSwf2sC8CQRrGnDnn7DUqk3HTp+
         K/JRM1DnkvaNd9BsnBMk4Kcu2VDwfu7BGZmH5X8U9bJzMspNl2CnIccZfOWGeIlyw5wf
         vVjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L2NcAgNw8LwbuTMFTQaVIRWiehiXF9APpf+nCDY9Hko=;
        fh=KUNWx2wMBWQeKSAj3QO1WNqXFjAhdPwmBm+58k3eKsY=;
        b=ZqDULym9OcYyiptNqw9SqtRTh9OllfWFqXOo6VN64+26BGlOQgnRpCyTedh6HJeigj
         N8UCPv2Hi/nCJ9Q0DhAC0PPWQi9cXPAmbqWzO9WnIG/kw+sBG8tylpniL3qcOYmp3dMN
         4dn4HJzfsxxnGLnHF83WwvC8r75PbMqU2pc/TcyJ7OUlONBv9RnzQe+qCvbpbtY63d5L
         9dZZw6SilwmX8bfZw0nbqwd+hyaXBJRXmFBHS5WqT1aF8oD3b5IBf+WrMlcBe8j58kSj
         11otrGTSqXub5xkzu2AcT8urUG2q7ktp3a8x3vxsV2pAaY69RKD/ccCrucsSBsEs0JyI
         V3pg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1784034351; x=1784639151; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L2NcAgNw8LwbuTMFTQaVIRWiehiXF9APpf+nCDY9Hko=;
        b=oFyXMX9ti0YL0qV0iR8VtZKnYAg+wa96yRJMY2cxNFn+NWqW/5lHfb5nblDnvP8ot/
         6nvMU5SzvBnug0T54tikmP47TdMamY38ih0yRybdCHedoCCy1Zd7ISJQ1o2gzt3pztgC
         /JG2F5pOs4oAgkOEgCkC1NiUtYysl1VR1A5XT8CjRfwgN3pOMArfFGieq+AQG2Wj7mx1
         0Ix6g0Yy1nYHiARmyKSNu4Qgr8w4yN1YjBHc3M+a+aCLjdzUist1usXnJfRozGrZejqa
         0Igk/iwDNh9G2yBsKivwciMAn9V7NpQap1CxaWsaj3Cwu5kwTARn2T3wFTtlf9Om2PcN
         ruxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034351; x=1784639151;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2NcAgNw8LwbuTMFTQaVIRWiehiXF9APpf+nCDY9Hko=;
        b=mB7sF0QW7F7aVRxOxmBe4/M9BNf0DoAFqEzbFhN+TTcaW1Sf4jkjGi7I/f/g9uUs34
         lfX1J6svERwdyhPYzL6N3Iub0S9Tu0I3e8TrurAXGSEUh5pSc7LlLAsm967rxMNfi4uZ
         oeVKlToyfqS5oTf3doZ38wYHpx9Td/OR+2tS6LYpkny7HWIZZsUF4lqZ9WQ0m3L5Puhn
         VK+tOJs09ZzwV7lGmP3uBKqcHlY5lHKmtUgw+sPXefK5d8lLkhPAISGzx1lUSzlw6naJ
         PBMoKr4v2GRyJVrJgx36v/tG2KKkyyVoGDNcKOz0S4E4xYpv9A1zIXrjFEOx7mo3nwYJ
         f1Ig==
X-Forwarded-Encrypted: i=1; AHgh+RoM+bW3CQNqbE17ND/3mHT/fO47IIzoP0BQ2hLkCqHYAjeOMfOLJHwlej3RcgkuiYi4LQDorMAg7+w=@lists.infradead.org
X-Gm-Message-State: AOJu0YyIKBp+QYJztlANrI5WnT1+j84HnXawU77jkYL7U/KfqWGAchZu
	Nbn8Gf5z3V159IIIvutPO+NPF+jCHu9Ja8LwOct3BaBh1x9VO6RyEY2hs1/XKA2VmzRyUgEiSNy
	bY5MrFKvP21aa7UWlGGxM3tk5EEk4xO6GHeLJ2rq4gg==
X-Gm-Gg: AfdE7cn8C5sz5Tdju1TSBkBQcVaaRRYHlURPLJd80i4yo6nPTmlHKKkre2+4+llp91w
	+uoQDxKrU8PfpZQDerDy4Bwx4odiJu9vMec5TgtJ8vLRvdRgoa+UZx3MIfmnf84J4MsdpLvFwIy
	aivclmPFHJaD/YAO8URu4dq1zSr51dNnqMiNN70MFVUUtLz2B04AKef8FnJICV9Gs9/Q/mijxrk
	lAoDE7GJz3AraEWLneC8IaA9gSgw4iolYkq7BucsyJoa2nRceeArSWbFU/RE45tcDGoS97LUBJM
	Nl9qadF934Bgic0N9d0lmtWtVVTkXpjbvV3pW1RGeUNYh6qmbx7YW+N7E4Dx8oOhvMRqBevP1hZ
	xt+5E06gYFemLrzo=
X-Received: by 2002:a5d:5887:0:b0:470:6dc:848a with SMTP id
 ffacd0b85a97d-47f2dca7fafmr15576550f8f.2.1784034351347; Tue, 14 Jul 2026
 06:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260707122548.281685-1-qingwei.hu@bytedance.com>
In-Reply-To: <20260707122548.281685-1-qingwei.hu@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Jul 2026 18:35:39 +0530
X-Gm-Features: AUfX_mwNt_JswCBrkPN8wo_MZe_qdY6E8a8GFKfn-nzYnLb-iI-iMooL3KV8GcY
Message-ID: <CAAhSdy1F3jrK4eiuVvWTL1uidZxEsVbrNoDQ8gXpsK-3MgzyAA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Inject instruction access fault on unmapped
 guest fetch
To: Qingwei Hu <qingwei.hu@bytedance.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060553_583606_22C6B9BC 
X-CRM114-Status: GOOD (  21.35  )
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

T24gVHVlLCBKdWwgNywgMjAyNiBhdCA1OjU24oCvUE0gUWluZ3dlaSBIdSA8cWluZ3dlaS5odUBi
eXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IFdoZW4gYW4gaW5zdHJ1Y3Rpb24gZ3Vlc3QtcGFnZS1m
YXVsdCB0YXJnZXRzIGEgR1BBIHRoYXQgaXMgbm90IGJhY2tlZCBieQo+IGFueSBtZW1zbG90LCBL
Vk0gaGFzIG5vIE1NSU8gZW11bGF0aW9uIHBhdGggZm9yIHRoZSBmZXRjaC4gTG9hZCBhbmQKPiBz
dG9yZSBndWVzdC1wYWdlIGZhdWx0cyBjYW4gYmUgcm91dGVkIHRocm91Z2ggTU1JTyBlbXVsYXRp
b24sIGJ1dCBhbgo+IGluc3RydWN0aW9uIGZldGNoIGhhcyBubyBkYXRhIHBheWxvYWQgb3IgYWNj
ZXNzIHNpemUgZm9yIHVzZXJzcGFjZSB0bwo+IGNvbXBsZXRlIGluIHRoZSBzYW1lIHdheS4KPgo+
IFRyZWF0IHRoaXMgY2FzZSBhcyBhbiBhcmNoaXRlY3R1cmFsIGFjY2VzcyBmYXVsdCBpbiB0aGUg
Z3Vlc3QuIE9uIGJhcmUKPiBtZXRhbCwgZmV0Y2hpbmcgZnJvbSBhbiBpbmFjY2Vzc2libGUgcGh5
c2ljYWwgYWRkcmVzcyByYWlzZXMgYW4KPiBpbnN0cnVjdGlvbiBhY2Nlc3MgZmF1bHQgZm9yIHRo
ZSBzdXBlcnZpc29yIHRvIGhhbmRsZSB0aHJvdWdoIGl0cyB0cmFwCj4gdmVjdG9yLiBSZWZsZWN0
IEVYQ19JTlNUX0FDQ0VTUyBiYWNrIHRvIHRoZSBndWVzdCBzbyB0aGUgZ3Vlc3Qgb2JzZXJ2ZXMK
PiB0aGUgc2FtZSBjbGFzcyBvZiBleGNlcHRpb24gcmF0aGVyIHRoYW4gbGVhdmluZyB0aGUgZmV0
Y2ggYXMgYQo+IGhvc3QtaGFuZGxlZCBjb25kaXRpb24uCj4KPiBzdHZhbCBjb250YWlucyB0aGUg
dmlydHVhbCBhZGRyZXNzIG9mIHRoZSBwb3J0aW9uIG9mIHRoZSBpbnN0cnVjdGlvbiB0aGF0Cj4g
Y2F1c2VkIHRoZSBmYXVsdCwgd2hpbGUgc2VwYyBwb2ludHMgdG8gdGhlIGJlZ2lubmluZyBvZiB0
aGUgaW5zdHJ1Y3Rpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBRaW5nd2VpIEh1IDxxaW5nd2VpLmh1
QGJ5dGVkYW5jZS5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBwYXRjaCBhcyBhIGZpeCBmb3IgTGludXgtNy4yLXJj
WAoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYyB8IDE5
ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYyBiL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfZXhpdC5jCj4gaW5kZXggMGJiMGM1MWUzYzg5Li42Yzg1MzBiOWYyOWUgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X2V4aXQuYwo+IEBAIC0zOCw2ICszOCwyNSBAQCBzdGF0aWMgaW50IGdzdGFnZV9wYWdl
X2ZhdWx0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1biwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4ga3ZtX3Jpc2N2X3ZjcHVfbW1pb19zdG9yZSh2Y3B1
LCBydW4sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZmF1bHRfYWRkciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB0cmFwLT5odGluc3QpOwo+ICsgICAgICAgICAgICAgICBj
YXNlIEVYQ19JTlNUX0dVRVNUX1BBR0VfRkFVTFQ6IHsKPiArICAgICAgICAgICAgICAgICAgICAg
ICAvKgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIE5vIG1lbXNsb3QgYmFja3MgdGhpcyBH
UEEgYW5kIGFuIGluc3RydWN0aW9uIGZldGNoCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICog
Y2Fubm90IGJlIGVtdWxhdGVkIGFzIE1NSU8uIE9uIGJhcmUgbWV0YWwgYSBmZXRjaAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAqIGZyb20gYW4gdW5iYWNrZWQgcGh5c2ljYWwgYWRkcmVzcyBy
YWlzZXMgYW4KPiArICAgICAgICAgICAgICAgICAgICAgICAgKiBpbnN0cnVjdGlvbiBhY2Nlc3Mg
ZmF1bHQsIHNvIHJlZmxlY3QgdGhhdCBiYWNrIHRvCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICogdGhlIGd1ZXN0Lgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAqLwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBrdm1fY3B1X3RyYXAgaW5zdF90cmFwID0gewo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLnNlcGMgICA9IHRyYXAtPnNlcGMsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAuc2NhdXNlID0gRVhDX0lOU1RfQUNDRVNTLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLnN0dmFsICA9IHRyYXAtPnN0dmFsLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLmh0dmFsICA9IDAsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAuaHRpbnN0ID0gMCwKPiArICAgICAgICAgICAgICAgICAgICAgICB9
Owo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfdmNwdV90cmFwX3JlZGly
ZWN0KHZjcHUsICZpbnN0X3RyYXApOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAx
Owo+ICsgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIGRlZmF1bHQ6Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICAgICAgICAgICAgICAgICB9
Owo+IC0tCj4gMi4zOS41Cj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8va3ZtLXJpc2N2Cg==
