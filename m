Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4049E9D836
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 04:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/cNA8wTbKaPHY8d/tnvhlNQHbX8Ewc1HctDfnk1AJI=; b=V1h18cNkfh0CsW
	CUB30iuhxcWHo4vtIZ7oQP89wqksHrgduVJUxxZJKxVYajZQ4sdWBTGuaqZXa52w7udj2OYKFBnSG
	apGBfB0633wNtqLUuLBCAdgTMemwZ3tEzHZBXcye/KS0r+cvmOZUnkd+26hgTFenX+jXXcwefPInR
	CNd3J4eIwFPlNHGtfIoAAr0H8WDdVfQhpKepBD+SRyAdJLiFsLZFqCFV78BmVIJqi3A2k14FpFqB3
	KaubChEpRG8d8TDsiaT8/FNaDIM1v/jzes7emV9XURJ5/LsLw8GTaqFSa2QCJFiKYQE/dYArDEWfa
	GR6FC8PzaC1qCsZLxb+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9bXV-00000004lT8-0KZz;
	Mon, 06 Apr 2026 04:26:17 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9bXQ-00000004lRZ-2u8b
	for kvm-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 04:26:15 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-67fdb2afaf5so1357827eaf.1
        for <kvm-riscv@lists.infradead.org>; Sun, 05 Apr 2026 21:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775449570; cv=none;
        d=google.com; s=arc-20240605;
        b=br6hUImbXB7Og1PSOBvks49Qz8t7joJXZNFExhuLA0U9Tsk7wc+J6VxNbVUt/99EOu
         nN6t/oiQ9SXfHikVJrsxImc30WQpYgtozUKS7WoWyrNehi66MDuNg85xVT3aBF3P5Ml4
         h3CwAtNgZ0F5Geg6JaWoUDYukIM5D6LlX9tscdXRsVXFcN5g/cl9DBXlH1JmSeaSSZxl
         qTPPrdV2hAqLu6lez7zW5gmEseM4BqH/MilrVudxqUI4vu4t2uHesyPfEFpDRIaTUal4
         dPQwtPFQwy9ognsRPNpyfmnh+jXefN4Tg6td9bun3vvInJYNgTFF3SQihhQzWlBwqoy4
         T3/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d2Eqcpz26fbgpoHxUOQO5t6bHgkVihQ+ivm0vWcl2To=;
        fh=rbuEIzsYIr6/Ci4u+weYs2vcyXyAM8lWXjs5fQIK+YQ=;
        b=kXfJcogOMPRH7v3QuvDtVFfR4/RtRQaZOEcSwfNOl+GY9NVjon80qxhsLCUGMHrpto
         Sisg/rl1tYC9FGvIyUeUgNJZYxmTx1YS7mMmF0ZAIbcMxupTChZs8Thg1GdwElNZeBKo
         xeza02W/aXHigNPH+1Pu1Ju1flk/GntS9NenaMxMWS8oM9Txp0qd17Q6Pdv/yxDQPFbD
         Q47n6KBUU0b6UHz0BQ21Uz/T67Sm2eECPcQBNRKGKs0FN5619U9hJw6htMyKOAtZ5Ca/
         keR3Pw1haBOH6Bc8Zg+A0j9ExvumZya7BWaRxVyTNqDCmgBnDXBWnqIjszDBfRFccMQv
         ILYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775449570; x=1776054370; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2Eqcpz26fbgpoHxUOQO5t6bHgkVihQ+ivm0vWcl2To=;
        b=hsBhM+XuPwDwoSyiKl2v2+dB/lSeotSJB5pja7iEOpT8ipeEezbKwLiFZS5iqmtMom
         8LES5mGpKI21PxYM8ntuxnnSbTj1/8y9X75LgToldLSMAeXhYfNCCul5ZkohzHkm3QMC
         vkYZ7n66Q6YZYRV621cSju0kVx5g2otlZmXDuQ3k2T+Y7SjKek9Uw3VeL5VzcSFO5XRe
         8g5KE1q0mR2Lsx3yZMKwlc33+RvCdT+a+0Yk38decmeb0spGtvgxGQMdcRRVB7NSHm3p
         r2fU1D1oKegSw1YE2U0ZN3iOihAs+mSHLe9XYhzK9WyMwhOSZniQ/pC6Reo0y6ylKSYv
         lC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775449570; x=1776054370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d2Eqcpz26fbgpoHxUOQO5t6bHgkVihQ+ivm0vWcl2To=;
        b=iNORcl7i4s4l1AfAFUvuX33z/wuPv2X8UatFiQewGrGVIG0zA1NudsxDODToSEasRM
         FoPeMSBdGgCanj6o5Ea0op+/7fl3XlsTVyujf8BjKehJRLvoZIm77Yyv3XYdIkXLAB0Y
         FVDyVOsTKwcXaAxpZ6rNf2vVvRXv4462GX8vQY5SSgexB4yiPc3xlgEULvJMMMINnm16
         ol10DHmdzWf0AYI23dHwdyp5qWTRoWuKEJymvndxvrV/s9sWVuh54LswZgpeaBxw1uP5
         PLKtV55I8QGgrZzjrUxfuVSmYH+hYCViiYnqOKlRbrwF6lKPOF9X5jvEGC4Sj42wwmwt
         9YfQ==
X-Gm-Message-State: AOJu0Yxfw1YUqDhSRaFcVI6zXj8YUBQdzDbKBDSbsdKf45HALvEDnpBd
	NH9RaX8PCVrpNDnGkeLEuov+6jO9z4pJpGbS/yk6WOVBHuEYHieXdzB0GGRxEY9sgmhwej34xwW
	6cyihfJhgCI/N/K3H8fAhCTgh4GqUo3nHaBfULXWfjQ==
X-Gm-Gg: AeBDies2P1kz7dthYSp7MQElj1gCmbH9rUKhRFjsptSxWLOm96BolLWHyTEY9zEBpTD
	spTI77J4b2LL5Ehgv3MWOo8iFG/fwQNijznfR/TetwYqnmGYVwVwuMXL7wb6I9MwWMSdhupQzwY
	RPV7ku1vb00QWQgsvnMli6eaXa7gGtZiPGOj+LY2a9e20YjI/Y32aa8L+vuJbN8nh/i8orDpz/+
	GWnh8LnXITsYtW88Mk69O/PxCIVA91WeDrUx2UFnwHNh2buQmm1HcW2vS8bVeNiy4nSAXkySPPJ
	oWAUYlnGYImXCXBhA4wgENfs6BT78K4lLbWNBNO4pSAY8IRaO9+9rR6Eltrn3Atvf6uIWLeLMp4
	C1MQUi6NcVwel1eBcz6AK9Awckg==
X-Received: by 2002:a05:6820:169f:b0:67e:1063:37ff with SMTP id
 006d021491bc7-68220b4a1e7mr5624387eaf.36.1775449570255; Sun, 05 Apr 2026
 21:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260403232011.2394966-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260403232011.2394966-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 6 Apr 2026 09:55:59 +0530
X-Gm-Features: AQROBzDGT78x3zHvCoTNFnS1VnkRVlKe4WFUmhyAI0q8NrLRsHtw1tX_S_VT1YI
Message-ID: <CAAhSdy353CV6FYe7BzVFvvo6drhY5hHGcv4HnJDYo+3bfB4n5Q@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix shift-out-of-bounds in make_xfence_request()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_212612_857787_AA0E43D5 
X-CRM114-Status: GOOD (  18.33  )
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

T24gU2F0LCBBcHIgNCwgMjAyNiBhdCA0OjUw4oCvQU0gSmlha2FpIFh1IDx4dWppYWthaTIwMjVA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gVGhlIG1ha2VfeGZlbmNlX3JlcXVlc3QoKSBmdW5jdGlv
biB1c2VzIGEgc2hpZnQgb3BlcmF0aW9uIHRvIGNoZWNrIGlmIGEKPiB2Q1BVIGlzIGluIHRoZSBo
YXJ0IG1hc2s6Cj4KPiAgIGlmICghKGhtYXNrICYgKDFVTCA8PCAodmNwdS0+dmNwdV9pZCAtIGhi
YXNlKSkpKQo+Cj4gSG93ZXZlciwgd2hlbiB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHZjcHVfaWQg
YW5kIGhiYXNlCj4gaXMgPj0gQklUU19QRVJfTE9ORywgdGhlIHNoaWZ0IG9wZXJhdGlvbiBjYXVz
ZXMgdW5kZWZpbmVkIGJlaGF2aW9yLgo+Cj4gVGhpcyB3YXMgZGV0ZWN0ZWQgYnkgVUJTQU46Cj4g
ICBVQlNBTjogc2hpZnQtb3V0LW9mLWJvdW5kcyBpbiBhcmNoL3Jpc2N2L2t2bS90bGIuYzozNDM6
MjMKPiAgIHNoaWZ0IGV4cG9uZW50IDI1NiBpcyB0b28gbGFyZ2UgZm9yIDY0LWJpdCB0eXBlICds
b25nIHVuc2lnbmVkIGludCcKPgo+IEZpeCB0aGlzIGJ5IGFkZGluZyBhIGJvdW5kcyBjaGVjayBi
ZWZvcmUgdGhlIHNoaWZ0IG9wZXJhdGlvbi4KPgo+IFRoaXMgYnVnIHdhcyBmb3VuZCBieSBmdXp6
aW5nIHRoZSBLVk0gUklTQy1WIGludGVyZmFjZS4KPgo+IEZpeGVzOiAxM2FjZmVjMmRiY2MgKCJS
SVNDLVY6IEtWTTogQWRkIHJlbW90ZSBIRkVOQ0UgZnVuY3Rpb25zIGJhc2VkIG9uIFZDUFUgcmVx
dWVzdHMiKQo+IFNpZ25lZC1vZmYtYnk6IEppYWthaSBYdSA8amlha2FpUGVhbnV0QGdtYWlsLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPHh1amlha2FpMjAyNUBpc2Nhcy5hYy5jbj4K
ClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjEKClRoYW5rcywKQW51cAoKPiAtLS0KPiBW
MSAtPiBWMjoKPiAtIERyb3BwZWQgJ2lkeCcgdmFyaWFibGUgYW5kIGNvbXBhcmVkIHZjcHVfaWQg
YWdhaW5zdCBoYmFzZSBkaXJlY3RseSwKPiAgIGFzIHN1Z2dlc3RlZCBieSBBbmRyZXcgSm9uZXMu
Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3RsYi5jIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL3RsYi5jIGIvYXJjaC9yaXNjdi9rdm0vdGxiLmMKPiBpbmRleCBmZjFhZWFjNGViOGVi
Li40MzljMjBjMjc3NWFiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3RsYi5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rdm0vdGxiLmMKPiBAQCAtMzM4LDcgKzMzOCw4IEBAIHN0YXRpYyB2b2lk
IG1ha2VfeGZlbmNlX3JlcXVlc3Qoc3RydWN0IGt2bSAqa3ZtLAo+ICAgICAgICAgYml0bWFwX3pl
cm8odmNwdV9tYXNrLCBLVk1fTUFYX1ZDUFVTKTsKPiAgICAgICAgIGt2bV9mb3JfZWFjaF92Y3B1
KGksIHZjcHUsIGt2bSkgewo+ICAgICAgICAgICAgICAgICBpZiAoaGJhc2UgIT0gLTFVTCkgewo+
IC0gICAgICAgICAgICAgICAgICAgICAgIGlmICh2Y3B1LT52Y3B1X2lkIDwgaGJhc2UpCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKHZjcHUtPnZjcHVfaWQgPCBoYmFzZSB8fAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdmNwdS0+dmNwdV9pZCA+PSBoYmFzZSArIEJJVFNf
UEVSX0xPTkcpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBpZiAoIShobWFzayAmICgxVUwgPDwgKHZjcHUtPnZjcHVf
aWQgLSBoYmFzZSkpKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVl
Owo+IC0tCj4gMi4zNC4xCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8va3ZtLXJpc2N2Cg==
