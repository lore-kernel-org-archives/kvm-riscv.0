Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEBBCA0EED
	for <kvm-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 15:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nq2/Acu8oyWm7zkaeaeq1kFo1UwM9scL59jIQx/K0xw=; b=iid9uoFc1Nb1Lh
	EtDzi0oY0fb8MODcaipLJB+aMLPjt/kEMvUTlAbcaV8gPMERAJ7sWu0rcGKQPnCnpwic0x3Y8l3OJ
	nAgAXdpf1YuxZjDTB8eJH4fkgD7qIHx9ZlKawl9xPpWgJmCMSwm6XO2DcrKyz3pP/xhyIowJnrfTQ
	xwVgmgbjw4oAOSENBz/y7ZBA4XmP6wID+A+NUtftiiCtLOrIgmWoIou08MfH91U0TLW3e92QjeyBv
	CU/LLvaPd9MNI4mtII6wsCY1cJ5k7aM967ppN6TQJRqHh8EADccJKYz1v1Rpcy+vTkUCVH1ih+pi+
	RkP6OET3kH0DPgbTZrrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTxB-000000035pw-0jvI;
	Fri, 22 Aug 2025 15:45:21 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPlN-00000002HZO-1BNF
	for kvm-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 11:16:54 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3e9e0e38dcdso2586775ab.3
        for <kvm-riscv@lists.infradead.org>; Fri, 22 Aug 2025 04:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1755861412; x=1756466212; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Q/jRAhPC0Tmtp2ISTMDpD9VBCqxj20vPKIcSTLHsWE=;
        b=OAoYQnH3wcs01Wf0FFnmolQkXFOlUSo3oGXmmD2Zueek5qsLLhci7m0SqTaSmgojdW
         VQUJgcSGXsaYP//zkzIVfIoLcqUdx5LurbW3nZllDMCeCSj08eh1nUHZSEZWmS7Gx1yS
         IWyfIC8tKjozE89+zKTaBwrgPjjOVyFaxhZA2VU9M3amDpZJHAeTIhFpV7oHlFpAtehq
         URef+ziucsOSiQ2C28l0DGtwEmmj1NBJqIadGRAQR0w34QMHtFfqtp3WqR6bUuxBZCR3
         Ed7JD/sm177CCCu4XI/KxkKTQMSRjMYNDNDFrEpv/2AGNnNoBsS0DKVJ6b1E1ZTboeZQ
         dNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755861412; x=1756466212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Q/jRAhPC0Tmtp2ISTMDpD9VBCqxj20vPKIcSTLHsWE=;
        b=YGg+6pJ15teugHLx/atIdmhvqFPJGeoYsnTZL0o02XtN1dYnW247JBw1tHhzErAMfx
         quaYmJfwdKSCNf/hGd0QFQD5GJDOZgk9Xw9mXDMupvQ6rjUJAarHbYpw4IDasG2BiGbj
         WJ+XcNoEqupd5F8BGwF5cSaj4N2O7mCT21U8hQKtF9x02upnHqjkJbaKyDCjZZaNoX/T
         Ahs0E1e30x9PIE0qDyJObGZ5De/H2EGPHzLKFQz/trpl4WY1GuTjQk9NobUZR7Xhhnjy
         iGuEp6eAOv7nHZOYkHoY4fQvkdO4U/k4ZSi5kzZ0N6Ml5X/GRm+GJz1dNKH1/YJTFjqZ
         Amqw==
X-Forwarded-Encrypted: i=1; AJvYcCXWBga+HQLGkI7pqApZ05x5mvSGcsfqliK7g65si9A+8qVDOk4yjV8nej88kC8anz++t4FpeFs4Vyo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVGSKTolw7VypJCWVGKhHJxXapD/S4vtL/zJMSDfcSwoA/sBK2
	mieyh5BdbniXnqTxwAgOjmIeLODO9zsvhWvtZmYRqAz9I0P7YheNZXz6Uv7CUE/AtX+NitfoY05
	xMHeUp08NLb5fZkxxnzG1U4yxeC5Vo8RXEZGBsloyZA==
X-Gm-Gg: ASbGnctT2O11LXrs0nsscZg+sprml7kVkgxyVkfcIvRYLgZhAvN6cT0LagbmPkJG28v
	dXkrHOI2l4AZucdyZDeEKyhx/qCP+LGl8hXWBTELkvoKkosZLZ35QIgCE/UrG+l4L1vOlqdfKfr
	qBES8NfpJ6sd620p22+w2Pdn1R6PS2V8NZfhe6F4pink/U2GtawaTneaxAOcnwcuU8qKSJ6iPU/
	xNm50yoGwVl9RNWfHw=
X-Google-Smtp-Source: AGHT+IEf3catLTwMZg08ITt9v+soiykhih7JmD1rfhONXLyWgFCvIw5fWgoyzMygsiEhsdJqKvljnLxwiGXIRXDHO7Q=
X-Received: by 2002:a05:6e02:220b:b0:3e9:eec4:9b7f with SMTP id
 e9e14a558f8ab-3e9eec4a13cmr7393215ab.30.1755861412296; Fri, 22 Aug 2025
 04:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <49680363098c45516ec4b305283d662d26fa9386.1754326285.git.zhouquan@iscas.ac.cn>
In-Reply-To: <49680363098c45516ec4b305283d662d26fa9386.1754326285.git.zhouquan@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Aug 2025 16:46:39 +0530
X-Gm-Features: Ac12FXydDmBYaqaWI2oDhvXmh2nBQ17DyRxWSqA9fqFJ4rPMhrjf4Rw1RRPXrJg
Message-ID: <CAAhSdy0kpxEhz8AAiUUXapsEEGo4aMsDpSyMemr9khdYfy0OAw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Correct kvm_riscv_check_vcpu_requests() comment
To: zhouquan@iscas.ac.cn
Cc: ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_041653_321381_44099BBB 
X-CRM114-Status: GOOD (  14.74  )
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

T24gTW9uLCBBdWcgMTEsIDIwMjUgYXQgODowMOKAr0FNIDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4g
d3JvdGU6Cj4KPiBGcm9tOiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+Cj4gQ29y
cmVjdCBgY2hlY2tfdmNwdV9yZXF1ZXN0c2AgdG8gYGt2bV9yaXNjdl9jaGVja192Y3B1X3JlcXVl
c3RzYC4KPgo+IEZpeGVzOiBmNTVmZmFmODk2MzYgKCJSSVNDLVY6IEtWTTogRW5hYmxlIHJpbmct
YmFzZWQgZGlydHkgbWVtb3J5IHRyYWNraW5nIikKPiBTaWduZWQtb2ZmLWJ5OiBRdWFuIFpob3Ug
PHpob3VxdWFuQGlzY2FzLmFjLmNuPgoKUXVldWVkIHRoaXMgYXMgZml4ZXMgZm9yIExpbnV4LTYu
MTcKClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jIHwgMiArLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiBp
bmRleCBmMDAxZTU2NDAzZjkuLjNlYmNmZmZhYTk3OCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2t2bS92Y3B1LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiBAQCAtNjgzLDcgKzY4
Myw3IEBAIHZvaWQga3ZtX2FyY2hfdmNwdV9wdXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICB9
Cj4KPiAgLyoqCj4gLSAqIGNoZWNrX3ZjcHVfcmVxdWVzdHMgLSBjaGVjayBhbmQgaGFuZGxlIHBl
bmRpbmcgdkNQVSByZXF1ZXN0cwo+ICsgKiBrdm1fcmlzY3ZfY2hlY2tfdmNwdV9yZXF1ZXN0cyAt
IGNoZWNrIGFuZCBoYW5kbGUgcGVuZGluZyB2Q1BVIHJlcXVlc3RzCj4gICAqIEB2Y3B1OiAgICAg
IHRoZSBWQ1BVIHBvaW50ZXIKPiAgICoKPiAgICogUmV0dXJuOiAxIGlmIHdlIHNob3VsZCBlbnRl
ciB0aGUgZ3Vlc3QKPiAtLQo+IDIuMzQuMQo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdApr
dm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
