Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F26C83F17
	for <kvm-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 04:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DcjkBkWv6ptHcLuzVndCMdtoV3a2WSOf6dUpoqfdBKA=; b=NzgNKxRDqYlDce
	cbA1hvsmp+WID9o/ZZ4D1E2UN0ClPmzTHuP6mUpWheSskXeByW3MlK+wPaS+tqG4+hsjeZ1Cf6zIw
	dMZpYNxZDRaMAR2apn7pJK0GPZmgdCnE7foXVv6wrnPTG+nXyvwuqppzDvUN7smJmBYwvyhk10bgT
	3gH06FU8uiMGD87fnLQE9WIEXWvXNMmrpc/I79vRcn9p94a77TiEqd88J7llbzjqLyoIMNgAsuTlf
	kgmWzPPxQq3n3g0QerdAT6ecYQA9t8pBzN49Db5Jep6QADIoeDPd/YbLaWrlCsyjYH/vEHpMuJbxX
	yCqdBXTAND/TsN6+xsDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uccxn-0000000Bg9U-369O;
	Fri, 18 Jul 2025 04:44:51 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucctt-0000000BfoO-0EgZ
	for kvm-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 04:40:50 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3df2f937370so7147755ab.3
        for <kvm-riscv@lists.infradead.org>; Thu, 17 Jul 2025 21:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752813648; x=1753418448; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nk5P6Goql09+zLhT4UFf1bxLMW3kkptTgrc0lcznfeI=;
        b=acxMJAuLA2tqunUfY/rxhNwEq0HVoscGaYkELeQWQQWY7l07oXwwG+z/xp/vkhWkgu
         avm3+a/1Kw+yekQ/z52kYtwk+xkLmvozdrtCfzvrikMLHmIFJqh3Pxe6QAowsUCgSFst
         UyYo5gqJ8Okm4spSXl1gGhqqIAGRZvgkVp8Ve2vEhZOw55v0STiZs2v5v1/PXsAcW2dB
         iEduasydTuZTYGuZCQ+cPc4glRfo5zXlZpmLKpWd+GzG/4vn76UJkuVVgxOKQtMeZMw0
         WBHLPU+hV7bQKv+33nyGd+DXEOBztwFI8lR2Yg8MtwxVzleAlvZdkSHUbb5mOuLNpMVn
         tppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752813648; x=1753418448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nk5P6Goql09+zLhT4UFf1bxLMW3kkptTgrc0lcznfeI=;
        b=GVJCOfj6TNAd9sJX1zqk2TuDYeyJzQTP7yG+9Oc611jfj8aCXsWNSEfEQbVcRlCiTT
         ArwNWXeVuK25h/AKmkSB7kZ+nzowANSsOeZHAxbFIJgxlOsru6OLarXpC7c158cdOpUn
         9DUVuuF5wMYrN4jj69K3wQo7sOG5DaxYUgetHs4Z8aEDIIlReqEkFLatnHAaIRTH/Wyi
         70xwoEyd0KIDV8Ynmou9BLMssTd/Mt3EN36Kw0b85KjrepAqcz49rz8f4Q3xQ7XsV9c5
         s8xRTlV9xHJ/FG+/ORKe/Ca0FXUxmDFNZNqK36VBXGOapR95A6dvkvLnSeE25dPdE7pa
         OjNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW05QTzCEAw8kGjLOw7Yp0I1pMbFab2Rw6o1Ed4Fv4BJL7w0CkKhsQO25NeG1+JrMGNH2Px7QY3ukc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqPZhMUMkztQqC6eDivOCJ3HFqFiLVF69nfbffrKCQu3bi2SbG
	s/3wb8woNHCynVMluNW/BdPmJS+IoW2CDaU5YMZr/n0ASzwFxhVAK/bl+PCdd96uu5MM0PgcnHT
	e8d0kv1SdQZ/F3HX7nab8uuIhQ2We/0NhqOeqK0pJnw==
X-Gm-Gg: ASbGncvaCAAyQG6Fkf3chcEOiB+gAMTooovNHWhQjYqAII4ByY7xSNfrxduL8oySyHO
	ocHxfJGrf/iMk+OOJOGmsimpgx6/8f5P5+rwz9cWQkf9RkBtJFQBBb3Vz/3AV96Z43+x2W7Riw5
	le/bVGZBJ57Qi34GEsl34gLP3/vrEwQrqd7xcNFvMYyfap5yBffzAmFc03A+qGOdkdci5xlPOr1
	K7w2gaf
X-Google-Smtp-Source: AGHT+IEaxS0XjYOehQPTaQpINVNdrhTY0WgdZfr1X928tkogrZyS3xluTJGJB4k36Lrfe/UfgaiC4ceggmbdl7StqFo=
X-Received: by 2002:a05:6e02:440e:10b0:3e2:91bb:c075 with SMTP id
 e9e14a558f8ab-3e291bbc1c1mr30213165ab.22.1752813647913; Thu, 17 Jul 2025
 21:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-7-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-7-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 18 Jul 2025 10:10:36 +0530
X-Gm-Features: Ac12FXxfH_kRUff1qKzc565myWI6pwy0mWoGInqqgjbhV1vA028RQkFxaIa9Vtg
Message-ID: <CAAhSdy08d8DJL_kurFwHSTEm3i+0wv=Nfd0xP+kKR=6rFdm27w@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] RISC-V: KVM: Use the new gpa range validate helper function
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_214049_090323_3FAD94E5 
X-CRM114-Status: GOOD (  16.20  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMTI6MzPigK9BTSBBdGlzaCBQYXRyYSA8YXRpc2hwQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBSZW1vdmUgdGhlIGR1cGxpY2F0ZSBjb2RlIGFuZCB1c2Ug
dGhlIG5ldyBoZWxwZXIgZnVuY3Rpb24gdG8gdmFsaWRhdGUKPiB0aGUgc2hhcmVkIG1lbW9yeSBn
cGEgYWRkcmVzcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3Np
bmMuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQu
b3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYyAg
ICAgfCA1ICstLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jIHwgNiArKy0tLS0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfcG11LmMKPiBpbmRleCAxNWQ3MWE3Yjc1YmEuLjE2M2JkNDQwM2ZkMCAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9w
bXUuYwo+IEBAIC00MDksOCArNDA5LDYgQEAgaW50IGt2bV9yaXNjdl92Y3B1X3BtdV9zbmFwc2hv
dF9zZXRfc2htZW0oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHMKPiAgICAg
ICAgIGludCBzbmFwc2hvdF9hcmVhX3NpemUgPSBzaXplb2Yoc3RydWN0IHJpc2N2X3BtdV9zbmFw
c2hvdF9kYXRhKTsKPiAgICAgICAgIGludCBzYmlyZXQgPSAwOwo+ICAgICAgICAgZ3BhX3Qgc2Fk
ZHI7Cj4gLSAgICAgICB1bnNpZ25lZCBsb25nIGh2YTsKPiAtICAgICAgIGJvb2wgd3JpdGFibGU7
Cj4KPiAgICAgICAgIGlmICgha3ZwbXUgfHwgZmxhZ3MpIHsKPiAgICAgICAgICAgICAgICAgc2Jp
cmV0ID0gU0JJX0VSUl9JTlZBTElEX1BBUkFNOwo+IEBAIC00MzIsOCArNDMwLDcgQEAgaW50IGt2
bV9yaXNjdl92Y3B1X3BtdV9zbmFwc2hvdF9zZXRfc2htZW0oc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCB1bnNpZ25lZCBsb25nIHMKPiAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gICAgICAgICB9
Cj4KPiAtICAgICAgIGh2YSA9IGt2bV92Y3B1X2dmbl90b19odmFfcHJvdCh2Y3B1LCBzYWRkciA+
PiBQQUdFX1NISUZULCAmd3JpdGFibGUpOwo+IC0gICAgICAgaWYgKGt2bV9pc19lcnJvcl9odmEo
aHZhKSB8fCAhd3JpdGFibGUpIHsKPiArICAgICAgIGlmIChrdm1fdmNwdV92YWxpZGF0ZV9ncGFf
cmFuZ2UodmNwdSwgc2FkZHIsIFBBR0VfU0laRSwgdHJ1ZSkpIHsKPiAgICAgICAgICAgICAgICAg
c2JpcmV0ID0gU0JJX0VSUl9JTlZBTElEX0FERFJFU1M7Cj4gICAgICAgICAgICAgICAgIGdvdG8g
b3V0Owo+ICAgICAgICAgfQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9z
dGEuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jCj4gaW5kZXggNWYzNTQyNzExNGMx
Li42N2RmYjYxM2RmNmEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3Rh
LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYwo+IEBAIC04NSw4ICs4NSw2
IEBAIHN0YXRpYyBpbnQga3ZtX3NiaV9zdGFfc3RlYWxfdGltZV9zZXRfc2htZW0oc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBzaG1lbV9waHlzX2hpID0gY3At
PmExOwo+ICAgICAgICAgdTMyIGZsYWdzID0gY3AtPmEyOwo+ICAgICAgICAgc3RydWN0IHNiaV9z
dGFfc3RydWN0IHplcm9fc3RhID0gezB9Owo+IC0gICAgICAgdW5zaWduZWQgbG9uZyBodmE7Cj4g
LSAgICAgICBib29sIHdyaXRhYmxlOwo+ICAgICAgICAgZ3BhX3Qgc2htZW07Cj4gICAgICAgICBp
bnQgcmV0Owo+Cj4gQEAgLTExMSw4ICsxMDksOCBAQCBzdGF0aWMgaW50IGt2bV9zYmlfc3RhX3N0
ZWFsX3RpbWVfc2V0X3NobWVtKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gU0JJX0VSUl9JTlZBTElEX0FERFJFU1M7Cj4gICAgICAgICB9Cj4K
PiAtICAgICAgIGh2YSA9IGt2bV92Y3B1X2dmbl90b19odmFfcHJvdCh2Y3B1LCBzaG1lbSA+PiBQ
QUdFX1NISUZULCAmd3JpdGFibGUpOwo+IC0gICAgICAgaWYgKGt2bV9pc19lcnJvcl9odmEoaHZh
KSB8fCAhd3JpdGFibGUpCj4gKyAgICAgICAvKiBUaGUgc3BlYyByZXF1aXJlcyB0aGUgc2htZW0g
dG8gYmUgNjQtYnl0ZSBhbGlnbmVkLiAqLwo+ICsgICAgICAgaWYgKGt2bV92Y3B1X3ZhbGlkYXRl
X2dwYV9yYW5nZSh2Y3B1LCBzaG1lbSwgNjQsIHRydWUpKQo+ICAgICAgICAgICAgICAgICByZXR1
cm4gU0JJX0VSUl9JTlZBTElEX0FERFJFU1M7Cj4KPiAgICAgICAgIHJldCA9IGt2bV92Y3B1X3dy
aXRlX2d1ZXN0KHZjcHUsIHNobWVtLCAmemVyb19zdGEsIHNpemVvZih6ZXJvX3N0YSkpOwo+Cj4g
LS0KPiAyLjQzLjAKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9rdm0tcmlzY3YK
