Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D836606A323
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 15:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a5u6E+fS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=GQC4XNx8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1OYiYI5UN4Df2n9PM2sQ+J32U22bk/hDNXtvkbCvyKE=; b=a5u6E+fSPsCmX9PswMJ7ZWvuhj
	6cQBqHICJLRV+s3zm7toFi+mep9Ja1EjnK8svu3PmVDzG+j7sGw/byJG9vliuqjSz/P6jFeTYCG/S
	OfBUtPdGpjeu69h9VYlNnsWtz6FcFyVOmvQPOw+6EPJ3H5pQXb06z43rJ9m8bVBkToxNCVbeXJv1P
	UO9brj2XCgLlpDBLE2+yHAAUAU8Ie/eILg3vaVcJS/MVNFW9Ug8Yy5QpBJF5+0BzadQo7BrTNM86p
	yQs5U+DbWZp+gYRAA44DIEAG8lbb6BlUZBJ/KgZ5m8uuaObLln0+NSVqVQi9N+RttOPvPInEtho/M
	KTgrpdMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEaF-0000000AIEH-1fPe;
	Wed, 25 Nov 2026 15:06:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEa9-0000000AIBl-2gO0
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 15:06:53 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so7592425e9.2
        for <kvm-riscv@lists.infradead.org>; Wed, 25 Nov 2026 07:06:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795619206; cv=none;
        d=google.com; s=arc-20260327;
        b=k/rvkUGrxBGR+ngdLsncqVKq3v2sU2d/qTirnVwGDmpGwpIp74gPhGy4+pGpqSh2qv
         ep8vVb0bEnroaYLjmzQXY/glNJpX07tGzugCzI+ieDfAZrpH3+99oC5FwBoctutcf9xT
         vSEa5Of8qLJpo8OjJt/gwXzRhXDrRMo1xofLCf70nbcmbCUxY8zK6y5hNraB9BuPN4z7
         5tSnkhM6Lwgu1z78NqK1dH9kC4e6dslHzpf+Q/oZc7LRwbDBpTxnX7CNT7peuOd17mwv
         2VvluX427IzVsQX6LMbl6cx+yl3A4pjyGCxaCiPMWTAC53vbeJoNanAe5sKrAwwnjoA9
         9Ykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wQhYGWbmYRpOsQh048VImHZFZtKvuW+wybi1/wHnwY8=;
        fh=2Bfwb+L5a0WshwierqP7WJveA28A2ppmTY3QZMfEiqY=;
        b=sSsKQlauXJ01VxPHOzbIdGcRR0J7WUeRc/sDsj9httlSO2ZTYL1doaX3bqBwWCWyF1
         khgLksdNZfBXfgA/3YVNtDYDNvHhoYYJgWJ05ypqbgYr1Co1BBTFCQvzadPcwpdAO41E
         s0p+gEdRSHf36bwkejnJlwM5FXx5kGAssnqUd3dydDK0SEO1B0OvKchxrO6VD7BWPXgW
         8fXareCaoK3Qr9qEfvTjYA1DurwbaaV7ICIox4JKy2+2Fi9578rg4/zOWnuH9yzz/QEL
         Fw6PZE39PzCUCpuIvnU2TrQ1PCdonbskCoegUXgblCWK5OhdA+ILSwV5rFV5hM+Lzj55
         NcFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795619206; x=1796224006; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wQhYGWbmYRpOsQh048VImHZFZtKvuW+wybi1/wHnwY8=;
        b=GQC4XNx8xv2jzqMwAUuwfvFFTTPpTlpUQbDBQKgpqc7gAPA6ytWmRG7ZN9F1xzWL33
         k8XQ02skWX6EX9yoJ4iYLpQV5nYNFyKg7meb832ZeQ6UleHBwQcCmC2x+w+RNxdGbeCv
         zLy5kBkRqMc+Pn+cPUhAVcUKqEsFRqRZq11TqOTBL25IKYgJso62ZUO/9fRHH7QMeTb3
         NJqwNfz9hz8C3gXGZhln+vWpYRffctC3DpkOZ02kRuCZKFbJntsx2nB6oOm2nqDB54WX
         hDqr/3QXEMOAsHhFnF/IJ3ZyPNDn6kJ+v4p3w5dvQkZk8eV3n8DjXzUi4O6QuWNbIVfM
         7JyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619206; x=1796224006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQhYGWbmYRpOsQh048VImHZFZtKvuW+wybi1/wHnwY8=;
        b=0+cqpqueHups/pga4FhpPgKSxLNnPsxATRHrrZAbHvkUvUg9Rn3SrA0x5bm8Tv9fYL
         z2AEFn9JW7NMWaDaARdPsUFprGoPLvTwTMrXwCy6TV9BgUwxrNJkkwiT9pqxesF8fWsm
         9IjroY9O+NyG/ybGpYu+WbEJhXxlAZPydWMAn0J60EXtTIhFxAbiNEfSluq9K1vqJsGO
         6k8FZUaWObdXBfC8uyJlj4MZUR48N3l7nivM+rqvzeiwZIfvEQ81FKR1SMhLkX+yJJea
         xgmsi7KjzM594E8RBVoG3+rPgXn+mHFuC5oc8+VerA0wwC6dBIIxHSEym/MAQqLazTg2
         2P2w==
X-Forwarded-Encrypted: i=1; AL+hErG2qvfxRg2cLGphDgNcWW3wReRJDKJdjZBU6welf+OzDSqdtlSIp0QieCbsZQdvUZUM1DplalV0hgU=@lists.infradead.org
X-Gm-Message-State: APuU4Z9B9mojue/PgWVGLMsXITC7thVbCO4gQpdDtiLjxImXX8OE465p
	lXB37FehxqNcWqh//FkOBQRYZL6vAsMZBo4f7HKrxEUT6t+VzA6iwXrsjPyYGxNiatTpeFbIDHW
	W4WnLRLq+ixmKPOHyJUBX6awMOvh/J/s9SbaJkZfBwQ==
X-Gm-Gg: AZFdTZfupOx2R7iNFo10r7iMOTxj/EjCYRXhrisDrAgucmRLFCVEucikqBYZpQCNs2U
	sCOhaOof7h3/RPNCNYCsaMtiYD4rRcypQvSXqOpoTDTZgJLEE6z0Dcd8tdqu5TjP3Fs87RvUA1T
	8tGf9/YgAGXtgsF923mcth8quz9Cyttckqooed4JFRjbQ1yKDv9lvQwCKzfBP8WyXrIRk9hsJkC
	8gz71TCEJAYfj48rzJqaMN2JsgrkIotYv6Ap+mYSDkCjicd8EtNG3Au5sIyNPnGRhc3HXABwkOq
	uNSUz6tzoQCUID60ueYwxiszdzNQTJyiurqWi8+1U181mS3GtcTuH4VUtkTMGcD19kpCHG6rKsE
	bJMCBXb+VtaukduYPxHiLLQWPCn5j2Jb/dTdcrARfUPGg7an+9gsMRPfA97em/gajutyw+kpbdj
	yzGNseFloeBpnPKipO/oZZSkaVISGrQ++DLUsw98jDIFAjSSc9ELuh
X-Received: by 2002:a05:600c:828e:b0:4a1:cd83:b23e with SMTP id
 5b1f17b1804b1-4bb88786ddemr337232595e9.0.1795619205644; Wed, 25 Nov 2026
 07:06:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260914055936.3672758-1-wang.yechao255@zte.com.cn> <20260914055936.3672758-2-wang.yechao255@zte.com.cn>
In-Reply-To: <20260914055936.3672758-2-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 20:36:34 +0530
X-Gm-Features: Aa3M54rWb_qwV0lybeTg4v6ZPTlnIV7_ygoXoP0dqWuArNVCCcEttr1PQxaya24
Message-ID: <CAAhSdy2-HGNfbBCJeXPS0wyTaSt+C9rHw08K6dn5DcJCLWy+rw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] RISC-V: KVM: add tracepoint for guest page faults
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_070649_721840_F9634215 
X-CRM114-Status: GOOD (  14.06  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgMTE6MzfigK9BTSBXYW5nIFllY2hhbyA8d2FuZy55ZWNo
YW8yNTVAenRlLmNvbS5jbj4gd3JvdGU6Cj4KPiBBZGQgdGhlIGt2bV9wYWdlX2ZhdWx0IGV2ZW50
IHRyYWNlcG9pbnQgdG8gY291bnQgdGhlIG51bWJlciBvZiBLVk0KPiBndWVzdCBwYWdlIGZhdWx0
cy4KPgo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS90cmFjZS5oICAgICB8IDIyICsrKysrKysrKysr
KysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgfCAgMiArKwo+ICAyIGZp
bGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2t2bS90cmFjZS5oIGIvYXJjaC9yaXNjdi9rdm0vdHJhY2UuaAo+IGluZGV4IDIzYTVmZDFiNjg2
ZS4uMDdmY2Y1YjYwNTliIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3RyYWNlLmgKPiAr
KysgYi9hcmNoL3Jpc2N2L2t2bS90cmFjZS5oCj4gQEAgLTEzMyw2ICsxMzMsMjggQEAgVFJBQ0Vf
RVZFTlQoa3ZtX3ZjcHVfaXJxLAo+ICAgICAgICAgICAgICAgICAgIF9fZW50cnktPnZjcHVfaWQs
IF9fZW50cnktPmlycSwgX19lbnRyeS0+bGV2ZWwpCj4gICk7Cj4KPiArVFJBQ0VfRVZFTlQoa3Zt
X3BhZ2VfZmF1bHQsCj4gKyAgICAgICBUUF9QUk9UTyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU2
NCBmYXVsdF9hZGRyZXNzLCB1NjQgZXJyb3JfY29kZSksCj4gKyAgICAgICBUUF9BUkdTKHZjcHUs
IGZhdWx0X2FkZHJlc3MsIGVycm9yX2NvZGUpLAo+ICsKPiArICAgICAgIFRQX1NUUlVDVF9fZW50
cnkoCj4gKyAgICAgICAgICAgICAgIF9fZmllbGQodW5zaWduZWQgaW50LCAgIHZjcHVfaWQpCj4g
KyAgICAgICAgICAgICAgIF9fZmllbGQodTY0LCAgICAgICAgICAgIGZhdWx0X2FkZHJlc3MpCj4g
KyAgICAgICAgICAgICAgIF9fZmllbGQodTY0LCAgICAgICAgICAgIGVycm9yX2NvZGUpCj4gKyAg
ICAgICApLAo+ICsKPiArICAgICAgIFRQX2Zhc3RfYXNzaWduKAo+ICsgICAgICAgICAgICAgICBf
X2VudHJ5LT52Y3B1X2lkICAgICAgICA9IHZjcHUtPnZjcHVfaWQ7Cj4gKyAgICAgICAgICAgICAg
IF9fZW50cnktPmZhdWx0X2FkZHJlc3MgID0gZmF1bHRfYWRkcmVzczsKPiArICAgICAgICAgICAg
ICAgX19lbnRyeS0+ZXJyb3JfY29kZSAgICAgPSBlcnJvcl9jb2RlOwo+ICsgICAgICAgKSwKPiAr
Cj4gKyAgICAgICBUUF9wcmludGsoInZjcHUgJXUgYWRkcmVzcyAweCUwMTZsbHggZXJyb3JfY29k
ZSAweCVsbHgiLAo+ICsgICAgICAgICAgICAgICBfX2VudHJ5LT52Y3B1X2lkLAo+ICsgICAgICAg
ICAgICAgICBfX2VudHJ5LT5mYXVsdF9hZGRyZXNzLAo+ICsgICAgICAgICAgICAgICBfX2VudHJ5
LT5lcnJvcl9jb2RlKQo+ICspOwo+ICsKPiAgI2VuZGlmIC8qIF9UUkFDRV9LVk1fSCAqLwo+Cj4g
ICN1bmRlZiBUUkFDRV9JTkNMVURFX1BBVEgKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0v
dmNwdV9leGl0LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYwo+IGluZGV4IDg4ZTBjMzY5
YjM1NC4uZGUwMjYyZDBmZDk1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhp
dC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMKPiBAQCAtMjksNiArMjksOCBA
QCBzdGF0aWMgaW50IGdzdGFnZV9wYWdlX2ZhdWx0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3Ry
dWN0IGt2bV9ydW4gKnJ1biwKPiAgICAgICAgIG1lbXNsb3QgPSBnZm5fdG9fbWVtc2xvdCh2Y3B1
LT5rdm0sIGdmbik7Cj4gICAgICAgICBodmEgPSBnZm5fdG9faHZhX21lbXNsb3RfcHJvdChtZW1z
bG90LCBnZm4sICZ3cml0YWJsZSk7Cj4KPiArICAgICAgIHRyYWNlX2t2bV9wYWdlX2ZhdWx0KHZj
cHUsIGZhdWx0X2FkZHIsIHRyYXAtPnNjYXVzZSk7Cj4gKwoKVGhlIHRyYWNlX2t2bV92Y3B1X2V4
aXQoKSBpbiBrdm1fcmlzY3ZfdmNwdV9leGl0KCkgYWxyZWFkeSBjb3ZlcnMKYWxsIHRyYXBzIHNv
IEkgZG9uJ3QgdGhpbmsgd2UgbmVlZCBzZXBhcmF0ZSB0cmFjZSBwb2ludCBmb3IgRy1zdGFnZQpw
YWdlIGZhdWx0cy4KClJlZ2FyZHMsCkFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
