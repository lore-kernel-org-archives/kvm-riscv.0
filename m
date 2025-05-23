Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BA8C54ED1
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 16:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYv10hlGfvDEDyxpj7lpcyPDuM6+jCeOWf+uxn5iBBQ=; b=PqeXFcYgfDK2U+
	skMvYL9rn861WhEhxBojboUy4OLNGbb1V3F4Mgob7AazSVbwkyQVB8H9ZmHdDcrEg9XB6lITwUK60
	HiojsGU69Ep4pCA0dG+yWbTnPREwMO5JzVZW5Pk3dZ8PxAF9wfIHQTHoMia5gF9t3A5B1qcJ2Zwl7
	HWB4RMm77U+M85dxvm2EnTCSPSu4oNWbSeZFyK3XAGKN9LTG7JXqO71MuESvwgehQ0/HWVheGipT+
	B9lLvcvEMuEwclPKm5tsQYiBJb2e7tPrTgVtRR8CZUpXRXfkn/3fM4Pi2FLONHOISiKbHns/0ziU2
	Cmyo2gRvlH4uF9I8Id+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVcj-00000004SQV-1Pn5;
	Fri, 23 May 2025 16:51:57 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVEj-00000004OtJ-2Iwf
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 16:27:10 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a365bc0af8so14400f8f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 09:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748017628; x=1748622428; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ia6puvfZPG5fMJM1ZRtmeD9phh8ksFStnHEcrbqR9QM=;
        b=QLTOrgAWiQK6Yq9F3JabwfTgDju05zqwVHR0RojiSznplt2DXchmrhBJf7IJT90Exp
         o+FW7y+f/i9BHrD8RmFWnXDv6zcCEuvNLE7KKIYebM+TIaqChZ9d6pvfKbfrli1I0ExW
         xiD3HA/PLkflk/ghS7V/nEYpxxNffXO8i17RxB+HIPVvkvlWNwBmix8Rd5FfNaTQzMLX
         tEY+bZzV/msoJMZjQ5szKlo7219f5IOkkeO2jpyYJ2aOGLw4yKyKUWHwyZn3Oq4DVII7
         bzA/rYQhRcdJAYlb3I+uhYwtpCyys53dGBDAZLV+CGwdBX/7+dUxOoapPisz5wIoTVPJ
         007Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748017628; x=1748622428;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ia6puvfZPG5fMJM1ZRtmeD9phh8ksFStnHEcrbqR9QM=;
        b=KcVC27QUEJ37vJFtPLm2J/7h7yXzhSFomT1EL67myvtaxoQzZ08IT64glau2sc2Ew3
         ORmjseFc2YYzHvu8F0Uf0I7a68wQlxIuGyvuWjAXF62oc3XZMMzm6kwCpUAxyzowoG9V
         Wz5/G5OXluwht0INWQQ81jsQETFcVUzKI79P+nOuMA+xOsiz5SgCdQKU888k1Yb45xyR
         QJpNEFuh9Me6GNyIW2Gp781R2bklDQ8VQId/CNnhqhoSva59iDzGbFw6NYGKxygWn+F/
         JKwv+LL8nyzFy7L5BPToQyad4duZgs2WYCV8rJyCFmfaWwSmSziiV+Ft5Iui3Eowt1nk
         mSLw==
X-Forwarded-Encrypted: i=1; AJvYcCW9IyWvYRekwWrZaTQxI3+waVPF0gaR8KxOmz9CrCw/Z8A8Ay94lQLewrGNI0bvL8LEVrnqqZ6FEBA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZxGvHlxJL6rYE6+Cbysd1oQX7ZMyoVR2Xfw62zRjttryZ6RED
	NfApRKTDhxcOqlv9GZkHfBJP1SSqKlJGfmRf1C2YF9j/XV8PmQcJQ3Np21HbjqSKXgo=
X-Gm-Gg: ASbGnctPaMoC7hECTfe6BcMGt3B4Dlb6ihyOZo0sACHaPqD6TuQVW5lHkxSnirZLp8P
	25VJeDlgP8A6gWlvGwH/83xwpb3hVD/b7HY2DaOSNUklWXhLsAFeVJhklTDAB+FIsUdQ0+T9Sk+
	OXseRncHUFZpbc3WnFpqrCqTQivxjKbDjA9aYfuB+oM/Q45KGVZRIio6qIf+Kg3O8z3bZOJoSMQ
	QGipdkxiBZr6b21jCrHNjT0a5dDbbXQ1863uNuXDX9K03GS3O3tpwoP2E2Ij1ohr/XjznwiARNK
	wYuLpWSToYGKnDnfro+Y/QWqtVCoNXmJqGkGgri6iWJONxRY8JRs0pEEWJIKRdqCeq5EqA==
X-Google-Smtp-Source: AGHT+IGu5SqOXXJDnZhsvGxzP9Q90JnNNFmT1bVPxtvjIRaUq9pqy0zhm7LZZhwBJv3AkH7nFc+56w==
X-Received: by 2002:a05:6000:230e:b0:3a4:bafb:adaa with SMTP id ffacd0b85a97d-3a4c2b3b3d4mr1273822f8f.3.1748017627898;
        Fri, 23 May 2025 09:27:07 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:be84:d9ad:e5e6:f60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a368250dbbsm22377027f8f.47.2025.05.23.09.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:27:07 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 23 May 2025 18:27:07 +0200
Message-Id: <DA3OJ7WWUGLT.35AVP0QQDJRZV@ventanamicro.com>
Subject: Re: [PATCH v8 13/14] RISC-V: KVM: add support for FWFT SBI
 extension
Cc: "Samuel Holland" <samuel.holland@sifive.com>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Deepak Gupta" <debug@rivosinc.com>, "Charlie
 Jenkins" <charlie@rivosinc.com>, "Atish Patra" <atishp@rivosinc.com>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Anup Patel" <anup@brainfault.org>, "Atish Patra"
 <atishp@atishpatra.org>, "Shuah Khan" <shuah@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-kselftest@vger.kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-14-cleger@rivosinc.com>
 <DA3K95ZYJ52S.1K6O3LN6WEI0N@ventanamicro.com>
 <9f9e2869-725d-4590-887a-9b0ef091472e@rivosinc.com>
In-Reply-To: <9f9e2869-725d-4590-887a-9b0ef091472e@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_092709_611642_672DE408 
X-CRM114-Status: GOOD (  12.83  )
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

MjAyNS0wNS0yM1QxNzoyOTo0OSswMjowMCwgQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPjoKPiBPbiAyMy8wNS8yMDI1IDE1OjA1LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+
IDIwMjUtMDUtMjNUMTI6MTk6MzArMDI6MDAsIENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9z
aW5jLmNvbT46Cj4+PiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKPj4+ICtz
dGF0aWMgY29uc3QgZW51bSBzYmlfZndmdF9mZWF0dXJlX3Qga3ZtX2Z3ZnRfZGVmaW5lZF9mZWF0
dXJlc1tdID0gewo+Pj4gKwlTQklfRldGVF9NSVNBTElHTkVEX0VYQ19ERUxFRywKPj4+ICsJU0JJ
X0ZXRlRfTEFORElOR19QQUQsCj4+PiArCVNCSV9GV0ZUX1NIQURPV19TVEFDSywKPj4+ICsJU0JJ
X0ZXRlRfRE9VQkxFX1RSQVAsCj4+PiArCVNCSV9GV0ZUX1BURV9BRF9IV19VUERBVElORywKPj4+
ICsJU0JJX0ZXRlRfUE9JTlRFUl9NQVNLSU5HX1BNTEVOLAo+Pj4gK307Cj4+IAo+PiBIb3cgd2ls
bCB1c2Vyc3BhY2UgY29udHJvbCB3aGljaCBzdWJzZXQgb2YgdGhlc2UgZmVhdHVyZXMgaXMgYWxs
b3dlZCBpbgo+PiB0aGUgZ3Vlc3Q/Cj4+IAo+PiAoV2UgY2FuIHJldXNlIHRoZSBLVk0gU0JJIGV4
dGVuc2lvbiBpbnRlcmZhY2UgaWYgd2UgZG9uJ3Qgd2FudCB0byBhZGQgYQo+PiAgRldGVCBzcGVj
aWZpYyBPTkVfUkVHLikKPgo+IEhpIFJhZGltLAo+Cj4gSSBkaWRuJ3QgbG9va2VkIGF0IHRoYXQg
cGFydC4gQnV0IG1vc3QgbGlrZWx5IHVzaW5nIHRoZSBrdm0gb25lIHJlZwo+IGludGVyZmFjZSBz
ZWVtcyBvayBsaWtlIHdoYXQgaXMgZG9uZSBmb3IgU1RBID8gV2UgY291bGQgaGF2ZSBwZXIgZmVh
dHVyZQo+IG92ZXJyaWRlIHdpdGggb25lIHJlZyBwZXIgZmVhdHVyZS4KClNvdW5kcyBmaW5lLgoK
PiBJcyB0aGlzIHNvbWV0aGluZyBibG9ja2luZyB0aG91Z2ggPyBXZSdkIGxpa2UgdG8gbWVyZ2Ug
RldGVCBvbmNlIFNCSSAzLjAKPiBpcyByYXRpZmllZCBzbyB0aGF0IHdvdWxkIGJlIG5pY2Ugbm90
IGRlbGF5aW5nIGl0IHRvbyBtdWNoLiBJJ2xsIHRha2UgYQo+IGxvb2sgYXQgaXQgdG8gc2VlIGlm
IGl0IGlzbid0IHRvbyBsb25nIHRvIGltcGxlbWVudC4KCk5vdCBibG9ja2luZywgYnV0IEkgd291
bGQgYXQgbGVhc3QgZGVmYXVsdCBGV0ZUIHRvIGRpc2FibGVkLCBiZWNhdXNlCmN1cnJlbnQgdXNl
cnNwYWNlIGNhbm5vdCBoYW5kbGUgWzE0LzE0XS4gIChXZWxsLi4uIHNhdmUvcmVzdG9yZSB3YXMK
cHJvYmFibHkgYnJva2VuIGV2ZW4gYmVmb3JlLCBidXQgbGV0J3MgdHJ5IHRvIG5vdCBtYWtlIGl0
IHdvcnNlLiA6XSkKClRoYW5rcy4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8va3ZtLXJpc2N2Cg==
