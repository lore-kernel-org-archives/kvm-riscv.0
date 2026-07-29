Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5314C53219
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 16:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qto6VuPSYnbZGfCa5C0Xep1JqC7zwXraNfGzfEhA5VQ=; b=avZSXpHKRM5KY5
	GUDULNiUZFjhn0JYwHW75dGIUKje3roWRbZpdPnSfeiN0NnhWJKEKJRw5leuZ4zPH3P228SeeD+pw
	MOGmod+8c0OzuoKkqa+XTTP3pbyuGQWMjBX3xiesgXB8lMt4WUKMRuE7XBCwdk0JMi3LRZqQW4edj
	zuCadLip/ZFfYSaqro9CmlUEMRJkFlzGc8h84J3+nvl55qX2VM9jck3xVz68FYiaDJJFLqDB2Eqly
	m+M5kNmN8jdczRJLS0RcbGEFAojoiWdg3PBGsVVeHs/2H+mo6AxA05krt2tvr2NVA7i7G8XHM9jjY
	5feDZX++wZjy9OS0YgGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp72H-00000008XG4-1au8;
	Wed, 29 Jul 2026 16:21:37 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp72F-00000008XFP-3CfE
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 16:21:36 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-476a130c138so1289317f8f.0
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 09:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785342094; cv=none;
        d=google.com; s=arc-20260327;
        b=oYNOEgtqwgWEoMXh2oPNZ9rRUcyqPf5icaRQ0nS5bIcSb8pbelaEJKf4kcmkZ49C0y
         1+OhgcUYOxBqVpoVxhxlx8w4kCd1X3/X8DGLuPLlLM3hAyLBdwEIlFiBbX3/WmHTg+tp
         G8uSoEorRmYcn3e01ccmjO2eMW8phQp9RGNiFGI1rRds6xDbbwXfnQYAp0n13xvTLeCy
         IYE+jujfgC4Ru72QvGbgBHQBxXRHIwqePoq5+QIgyQ5PC0ELsVJjV0cSdb7ZI8cdyVRI
         1Tgao1oA+kIB3yHVEgaRMn0XQTYHx70FsHwWb8wr/lkz3WTv5NnjdlZlW1TxL9wl67SK
         1kQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xlNUGStHPcM9h7uZ5gMcfZsRgLFM6lwcIC3C63GbVXU=;
        fh=ShwyAeUFxWnvCAZyaIvRjtfeQ1gk+r8J/FDrZTRD+o8=;
        b=APcinUUZjkujjLzn7enKYWvEwlQRpAj0idDreS9GZe4rSpdhTQ8EVOJ8dmCwQ5tS+C
         KPCooyrej9XX6sqq0E8qCPRlstsu55T0GL+28xCKWZNo9sxnsivusWQnwNBsnAUQCaN8
         zhGbmC1EDJ8NJ+5cckK8oVq+4JggZRYVXrS1w+cRFOTRcrLFv+kBFuAf/jBYsds0jMEa
         I+tnlsdv2QslneEMEFvIaks1S8VOJ2dF7bYG6AUqzQ3CWyrFffBI4M4BcJerN5NAdxh1
         7w44ExbCmdVPVBHzMHRqWRjHuNScac7umqhJ7leGb9sU8vgs/Pzg+ywlzD7KAICqKjC0
         tYyg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785342094; x=1785946894; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xlNUGStHPcM9h7uZ5gMcfZsRgLFM6lwcIC3C63GbVXU=;
        b=f1eu/psXn/h128Mp2VSsxGI0hcVXPFXSLcjwUDYeA1A6zMqwinkDlROog0MoKwUoFX
         rzY1EAqXlOw9NCqBbvfynC3MEj4/j1KOZYgI+UdTN5hHn2UKJ4t/2yRMAPawKO/yFPaf
         /vz6cMT4Cs3Lymix8m8b2YDm2i7kOtJChcHf/xNZYredgSrCTQAFtcGVvXCFvi9NxEZ/
         0k2wwzKM28XC3fIOr5aVFgSbje0OLUB4JdbVgHJnDmr3ePUnRTZI2dq6su1evfakBm7S
         mcl9Nzt7h/MfE6Az4xW7MsZGGoHJ8hKaWCjESzuhlmZoY6CTlvpuOHCvjXUi8nDUxiS7
         lhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785342094; x=1785946894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xlNUGStHPcM9h7uZ5gMcfZsRgLFM6lwcIC3C63GbVXU=;
        b=ixNrKvualFM/ooVC/hz84mGDJeQaIdSfPUme9hlgyKREbk11rLJEig/S1mMPgUDVaZ
         bxMMHh8sFtJMUXEdD/qJsJkJyM9Ymnl9U7bzcJqzW1GRK/JgxcQo8kNSjdlVJiX4H78d
         9aAydNRfo+V8Yr53SuCW0NdccxrUUTubDOTk4t5nS1Q1oU7Xrg+Puba0dTgTnXn91dqJ
         5qP+1zPvZEJ8Zw6ycqIRNLhFVkhWs8diI55FUp3y5YJpZuoHD4ElCUQ2Lgi7eFXxmcPx
         IfGHyjOPJLMshVNWW9VIVa7jlC80ysKNksqwFbdIZxsVLCI8iKnH+M6LpqDnTzeSvbq5
         70og==
X-Forwarded-Encrypted: i=1; AHgh+RoU8t+3iqUbRAasHuZmNh6qIPtYgxVmQnjgRkuk/hYNRlTfjYzzG9IHHoBtBaNe71Gpv6rbvCJ27H8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBPii5A4MUAsV5kszJ2/LHQkZRS4sfJwL77H3T4ScS5832y35q
	ufwSwc65CBTwWKAI5kgFZbBUtRhWrrtN+BhjGOOLwBxmtd4+2gJpXIFXGgTqGa3T+cgbl0ol9Ww
	/QY9q6vxuFUDtBpZz23cqr8mC1t/NulewuCaPfwLi7Z+88QgSNHLB0pyxxkBp
X-Gm-Gg: AR+sD104aKcRTk4npupW0hpz/+UBYcngzu+yVXjSrQ0NuuthaCobHkDeUKkq++yPMwn
	MMkB6YqyRBnLQ5FF4QY+uVcugBrGHGqIIIMGMopP36TOhWaDq72+OuoB71yGC4hxLEEewWDwGgs
	wo3mOqDC9UOCxXh0gzk23XWWd5i/Mff0n21NcaJ+ueY0RwIeR67VuGXmzeuG+ffccewp4DP5Dxd
	UBOkfh0ANFkDX8PSX1PfNk5o48HPOfyPczKaYdf3YD6VKcB+txYlOZAbvBDsVD/Foo9R1RGtWz5
	v7EE0EYtHBPyy43eTcwbrL7kjFR5L6z/nmZ/sWfDXGLoiw4OeoYyf2VJGQM7FztP25C3ZuQk/Mi
	V6NNvz0kXzXpff2D46ejGu4WzTQ9GLTzqW/Dib+ej5Ii9IP0kdNHFR5zLtvVdUqvr
X-Received: by 2002:a5d:5f51:0:b0:47f:91eb:342 with SMTP id
 ffacd0b85a97d-47fb1e89ab3mr9574371f8f.13.1785342093792; Wed, 29 Jul 2026
 09:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260729075230.743030-1-shanbeeyoo@gmail.com> <20260729120733.829457-1-shanbeeyoo@gmail.com>
 <20260729120733.829457-4-shanbeeyoo@gmail.com>
In-Reply-To: <20260729120733.829457-4-shanbeeyoo@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 21:51:19 +0530
X-Gm-Features: AUfX_mw18Ate4H7RNWrC9_sDszX8h_ptllZ_3py1A1MYtGllTZvUWlrvnw0-9-Y
Message-ID: <CAAhSdy0y-K3_-=_SCDwAqEiCb0PKmNHVcNDgyY+pGGF4N3gEGQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] RISC-V: KVM: Widen G-stage fault address to gpa_t
To: "Bingyu.Xian" <shanbeeyoo@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Quan Zhou <zhouquan@iscas.ac.cn>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_092135_843987_B4F1A954 
X-CRM114-Status: GOOD (  20.17  )
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

T24gV2VkLCBKdWwgMjksIDIwMjYgYXQgNTozN+KAr1BNIEJpbmd5dS5YaWFuIDxzaGFuYmVleW9v
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBmYXVsdF9hZGRyIGluIGdzdGFnZV9wYWdlX2ZhdWx0KCkg
YW5kIHRoZSBmYXVsdF9hZGRyIHBhcmFtZXRlciBvZgo+IGt2bV9yaXNjdl92Y3B1X21taW9fbG9h
ZC9zdG9yZSgpIGFyZSB1bnNpZ25lZCBsb25nLiAgT24gUlYzMiB3aXRoCj4gU3YzMng0LCBndWVz
dCBwaHlzaWNhbCBhZGRyZXNzZXMgYXJlIDM0IGJpdHMsIHNvIGEgMzItYml0IHVuc2lnbmVkCj4g
bG9uZyB0cnVuY2F0ZXMgYml0cyAzMi8zMyBhdCB0d28gcG9pbnRzOgo+Cj4gICAtIHJlY29uc3Ry
dWN0aW9uOiBmYXVsdF9hZGRyID0gKHRyYXAtPmh0dmFsIDw8IDIpIHwgLi4uIGlzIGV2YWx1YXRl
ZAo+ICAgICBpbiAzMi1iaXQgYXJpdGhtZXRpYywgZHJvcHBpbmcgYml0cyAzMi8zMyBiZWZvcmUg
d2lkZW5pbmc7Cj4gICAtIHRoZSBNTUlPIGhhbmRsZXIgY2FsbDogZXZlbiB3aXRoIHRoZSBsb2Nh
bCB3aWRlbmVkLCB0aGUgaGFuZGxlcidzCj4gICAgIHVuc2lnbmVkIGxvbmcgcGFyYW1ldGVyIG5h
cnJvd3MgaXQgYmFjayB0byAzMiBiaXRzLCBhbGlhc2luZwo+ICAgICBhY2Nlc3NlcyBhYm92ZSA0
IEdCIGludG8gdGhlIGxvdyA0IEdCLgo+Cj4gV2lkZW4gZmF1bHRfYWRkciB0byBncGFfdCBlbmQg
dG8gZW5kOiB0aGUgbG9jYWwgaW4gZ3N0YWdlX3BhZ2VfZmF1bHQoKSwKPiB0aGUgKGdwYV90KSBj
YXN0IGJlZm9yZSB0aGUgPDwyIHNoaWZ0LCBhbmQgdGhlIGZhdWx0X2FkZHIgcGFyYW1ldGVycyBv
Zgo+IGt2bV9yaXNjdl92Y3B1X21taW9fbG9hZC9zdG9yZSgpLiAgVGhlIGhhbmRsZXJzJyBpbnRl
cm5hbCB1c2VzCj4gKHJ1bi0+bW1pby5waHlzX2FkZHIgaXMgX191NjQsIGt2bV9pb19idXNfcmVh
ZC93cml0ZSgpIHRha2UgZ3BhX3QpIGFyZQo+IGFscmVhZHkgNjQtYml0LCBzbyBubyBmdXJ0aGVy
IGNoYW5nZXMgYXJlIG5lZWRlZC4KPgo+IEFsc28gaW4gcHJlcGFyYXRpb24gZm9yIHNoYXJpbmcg
YSBjb21tb24gc3RydWN0IGt2bV9wYWdlX2ZhdWx0IGFjcm9zcwo+IGFyY2hpdGVjdHVyZXMsIHdo
ZXJlIGZhdWx0X2FkZHIgaXMgZ3BhX3QuICBObyBmdW5jdGlvbmFsIGNoYW5nZSBvbiBSVjY0Lgo+
Cj4gRml4ZXM6IDlkMDVjMWZlZTgzNyAoIlJJU0MtVjogS1ZNOiBJbXBsZW1lbnQgc3RhZ2UyIHBh
Z2UgdGFibGUgcHJvZ3JhbW1pbmciKQo+IEFzc2lzdGVkLWJ5OiBZdWFuU2hlbmc6IGRlZXBzZWVr
LXY0LXBybwo+IENvLWRldmVsb3BlZC1ieTogUXVhbiBaaG91IDx6aG91cXVhbkBpc2Nhcy5hYy5j
bj4KPiBTaWduZWQtb2ZmLWJ5OiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+IFNp
Z25lZC1vZmYtYnk6IEJpbmd5dSBYaWFuIDxzaGFuYmVleW9vQGdtYWlsLmNvbT4KCkxHVE0uCgpS
ZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlz
IHBhdGNoIGZvciBMaW51eC03LjMKClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rdm1fdmNwdV9pbnNuLmggfCA0ICsrLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNw
dV9leGl0LmMgICAgICAgICAgICAgfCA1ICsrKy0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5z
bi5jICAgICAgICAgICAgIHwgNCArKy0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20va3ZtX3ZjcHVfaW5zbi5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9pbnNu
LmgKPiBpbmRleCAzNTAwMTFjODM1ODEuLmE1YzUwZGQ0YTg4NCAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X2luc24uaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20va3ZtX3ZjcHVfaW5zbi5oCj4gQEAgLTM4LDEwICszOCwxMCBAQCBpbnQga3ZtX3Jp
c2N2X3ZjcHVfdmlydHVhbF9pbnNuKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9y
dW4gKnJ1biwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrdm1fY3B1
X3RyYXAgKnRyYXApOwo+Cj4gIGludCBrdm1fcmlzY3ZfdmNwdV9tbWlvX2xvYWQoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgbG9uZyBmYXVsdF9hZGRyLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZ3BhX3QgZmF1bHRfYWRkciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgaHRpbnN0KTsKPiAgaW50IGt2bV9yaXNjdl92Y3B1X21taW9fc3RvcmUo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmF1bHRfYWRkciwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBncGFfdCBmYXVsdF9hZGRyLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaHRpbnN0KTsKPiAgaW50IGt2bV9yaXNjdl92Y3B1
X21taW9fcmV0dXJuKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1bik7
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgYi9hcmNoL3Jpc2N2
L2t2bS92Y3B1X2V4aXQuYwo+IGluZGV4IDZjODUzMGI5ZjI5ZS4uMjhjZjliMjdiYjA3IDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9r
dm0vdmNwdV9leGl0LmMKPiBAQCAtMTcsMTIgKzE3LDEzIEBAIHN0YXRpYyBpbnQgZ3N0YWdlX3Bh
Z2VfZmF1bHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+ICB7
Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX2dzdGFnZV9tYXBwaW5nIGhvc3RfbWFwOwo+ICAgICAgICAg
c3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqbWVtc2xvdDsKPiAtICAgICAgIHVuc2lnbmVkIGxvbmcg
aHZhLCBmYXVsdF9hZGRyOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBodmE7Cj4gKyAgICAgICBn
cGFfdCBmYXVsdF9hZGRyOwo+ICAgICAgICAgYm9vbCB3cml0YWJsZTsKPiAgICAgICAgIGdmbl90
IGdmbjsKPiAgICAgICAgIGludCByZXQ7Cj4KPiAtICAgICAgIGZhdWx0X2FkZHIgPSAodHJhcC0+
aHR2YWwgPDwgMikgfCAodHJhcC0+c3R2YWwgJiAweDMpOwo+ICsgICAgICAgZmF1bHRfYWRkciA9
ICgoZ3BhX3QpdHJhcC0+aHR2YWwgPDwgMikgfCAodHJhcC0+c3R2YWwgJiAweDMpOwo+ICAgICAg
ICAgZ2ZuID0gZmF1bHRfYWRkciA+PiBQQUdFX1NISUZUOwo+ICAgICAgICAgbWVtc2xvdCA9IGdm
bl90b19tZW1zbG90KHZjcHUtPmt2bSwgZ2ZuKTsKPiAgICAgICAgIGh2YSA9IGdmbl90b19odmFf
bWVtc2xvdF9wcm90KG1lbXNsb3QsIGdmbiwgJndyaXRhYmxlKTsKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2luc24uYwo+IGlu
ZGV4IGYwOWY5MjUxZDFmMC4uNjUwNjQxMWEzZjc4IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfaW5zbi5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMKPiBAQCAt
MzcxLDcgKzM3MSw3IEBAIGludCBrdm1fcmlzY3ZfdmNwdV92aXJ0dWFsX2luc24oc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+ICAgKiBSZXR1cm5zIDwgMCB0byBy
ZXBvcnQgZmFpbHVyZSBhbmQgZXhpdCBydW4tbG9vcAo+ICAgKi8KPiAgaW50IGt2bV9yaXNjdl92
Y3B1X21taW9fbG9hZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4s
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGZhdWx0X2FkZHIs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBncGFfdCBmYXVsdF9hZGRyLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBodGluc3QpCj4gIHsKPiAgICAg
ICAgIHU4IGRhdGFfYnVmWzhdOwo+IEBAIC00OTQsNyArNDk0LDcgQEAgaW50IGt2bV9yaXNjdl92
Y3B1X21taW9fbG9hZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4s
Cj4gICAqIFJldHVybnMgPCAwIHRvIHJlcG9ydCBmYWlsdXJlIGFuZCBleGl0IHJ1bi1sb29wCj4g
ICAqLwo+ICBpbnQga3ZtX3Jpc2N2X3ZjcHVfbW1pb19zdG9yZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIHN0cnVjdCBrdm1fcnVuICpydW4sCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyBmYXVsdF9hZGRyLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGdwYV90IGZhdWx0X2FkZHIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBodGluc3QpCj4gIHsKPiAgICAgICAgIHU4IGRhdGE4Owo+IC0tCj4gMi41NC4wCj4K
Ci0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
