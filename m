Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65641C369CB
	for <kvm-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 05:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kxy7V80HHk60iNu5QYHOMmSBXkPTEmCvoh6LlTtX0Qw=; b=ZE+xsDPerG7Ghy
	AixjBs5mYYaCTmcNz9SXnewvY0W/QNJyBjPjR+9slAPA6uBvAC9fLuHjgJSznXFxum3p1Bu6zvhTG
	U84Gp/kVxsbrrDytQkLjBLPAt3WQdQGlPsnJVCF2Hp8j5hAI8VofbLxHiM7lg4TElhDd5bXsscQDm
	MoGPlbG1PrMPORjTDR1jUfUPJtK82992WHDhWEBgu3R/nn10vBeAU+T+3ptaPwt4mLqE7/u44Tg24
	vVTz0bpYkTt0PiXRsEIBpquYgBjH7tizKn4QMteEnIzFc6mRgjjwIeBM4w1WAsL/SvXRLs7LOKoZL
	Enf+PB9DCqxGFOXHPrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dyL-00000008SJg-0Tus;
	Tue, 29 Apr 2025 05:57:37 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dwa-00000008S6G-0OFR
	for kvm-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 05:55:49 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54acc0cd458so6729804e87.0
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Apr 2025 22:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745906146; x=1746510946; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8eFfmotZuLjE/iIngsJ3KVYn6Hy+g0+LpOOBN4vUMQ=;
        b=YPlYODLhkCzcLsZNzR/KiCQ6bnFLPzBaBYq4jHylPzxnPK3GHY6tRjN9syKIZuTWHb
         YQIBwPe5jrqsA1oE4QFXCs7J8Bn95cf+KkCD+KkfsyauQmlXbb4V97dBH/V1ORmJseD7
         q+BOYk5PYxVHfRsr7uan0dBbGPvmRE9N8rdjUJZrh0nT3phGEEbd0b/t3ZvCTm6qKvho
         vUNHHTuGlCxRYfnQ+9FIJMrRqphverSFelr/BGAnbiDYtGgWnxBhGEYzv/xZYBOz68F1
         +Tq9rlUV3UKCLPpZecsO8prCr0r+AkIgf1xdPVlj1akGQOWrr2F1EHHpkPyei7bzP6rI
         8TvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745906146; x=1746510946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8eFfmotZuLjE/iIngsJ3KVYn6Hy+g0+LpOOBN4vUMQ=;
        b=E9fI7lpaDmk7a+JDKG9c+a6YkLoiHHklcf8gEJTLPCKAVWA1TeHtg9FgBuIOiv5LnC
         X8WV/YMZ/kLCP2+uVYl4ILNkoMiRzyIoSQfb8SPG+ZhT4ggiJIHPUke7+yYt5t0bXgCI
         yW0TYTyxbs/Kdr1dKXcB31fyPS7GCDXL2DgchHFUpEFRagKoAkIfRynpuwf+OF0QYH5e
         pyr+Dphknf5BUmcglJi0WrFh4BOBpg2UXA6BoxURqvOFtkFYU7ULVPA0i2jHv1/TUOd/
         r/n8CYVssWnZn6194ADOdRgYcUb/DhJIrWg3yZzizz36fjpn32dcprcwWagLPdEcSq0J
         smFA==
X-Forwarded-Encrypted: i=1; AJvYcCWa2oQtMwRS0vBmGitwVDsN1KF/WG7wq2I/Egfm4QyKMHcbNZfx+hqpkJJaL7HpKFl12LIP1Xz/c68=@lists.infradead.org
X-Gm-Message-State: AOJu0YyT4yII0xgPbEYa1VAJ3encSeAji8GN8QpC3d5VZ9RoHMcn6nDA
	kMfpvXmCAblTe42kCwwHRcX8AtoAeW71jAkeg53aliIw2Zasr2YUQGwhWrTftkzg+lv1ASuiEcL
	otpB08EWzLdHRIugt8/7gqA9Wt8A7SKZPDnkfaA==
X-Gm-Gg: ASbGncteJe0TePJT60Qjzzf4QbONUib1vKPX+W+jyasRQTgyTipZTe2r1VJazf6mOHN
	CYxNoEs++KU2CUuhHgvaNt4kDA/KqGr4GffWFA523RhVuIa+uk6tIw15FvNLK2UDit3+3Ebp1Qt
	Z8xQ6nM4m27h5X+mXdp9TbjiU=
X-Google-Smtp-Source: AGHT+IFYS//nAhdr5sQ4EKB26kjYn20qv5wR0iA6FrAr+cMy0GIfWIfPM3YUDHi8RlYpm+FL+B8w4CHY3E8C/pwtOoc=
X-Received: by 2002:a05:6512:6d1:b0:549:9044:94ac with SMTP id
 2adb3069b0e04-54e9e53e33cmr325134e87.23.1745906146173; Mon, 28 Apr 2025
 22:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com> <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
 <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com>
In-Reply-To: <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 29 Apr 2025 11:25:35 +0530
X-Gm-Features: ATxdqUEiQjMeNUujcFSuwa_LrU9ri9FCJKZ6XmhF2QYcnvi_LFsWj1huKA1q38o
Message-ID: <CAK9=C2Woc5MtrJeqNtaVkMXWEsGeZPsmUgtFQET=OKLHLwRbPA@mail.gmail.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming runnable
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_225548_132771_35FB11D2 
X-CRM114-Status: GOOD (  20.48  )
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

T24gTW9uLCBBcHIgMjgsIDIwMjUgYXQgMTE6MTXigK9QTSBSYWRpbSBLcsSNbcOhxZkgPHJrcmNt
YXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiAyMDI1LTA0LTI4VDE3OjUyOjI1KzA1OjMw
LCBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPjoKPiA+IE9uIFRodSwgQXByIDMsIDIw
MjUgYXQgNTowMuKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29t
PiB3cm90ZToKPiA+PiBGb3IgYSBjbGVhbmVyIHNvbHV0aW9uLCB3ZSBzaG91bGQgYWRkIGludGVy
ZmFjZXMgdG8gcGVyZm9ybSB0aGUgS1ZNLVNCSQo+ID4+IHJlc2V0IHJlcXVlc3Qgb24gdXNlcnNw
YWNlIGRlbWFuZC4gIEkgdGhpbmsgaXQgd291bGQgYWxzbyBiZSBtdWNoIGJldHRlcgo+ID4+IGlm
IHVzZXJzcGFjZSB3YXMgaW4gY29udHJvbCBvZiB0aGUgcG9zdC1yZXNldCBzdGF0ZS4KPiA+Cj4g
PiBBcGFydCBmcm9tIGJyZWFraW5nIEtWTSB1c2VyLXNwYWNlLCB0aGlzIHBhdGNoIGlzIGluY29y
cmVjdCBhbmQKPiA+IGRvZXMgbm90IGFsaWduIHdpdGggdGhlOgo+ID4gMSkgU0JJIHNwZWMKPiA+
IDIpIE9TIGJvb3QgcHJvdG9jb2wuCj4gPgo+ID4gVGhlIFNCSSBzcGVjIG9ubHkgZGVmaW5lcyB0
aGUgZW50cnkgc3RhdGUgb2YgY2VydGFpbiBDUFUgcmVnaXN0ZXJzCj4gPiAobmFtZWx5LCBQQywg
QTAsIGFuZCBBMSkgd2hlbiBDUFUgZW50ZXJzIFMtbW9kZToKPiA+IDEpIFVwb24gU0JJIEhTTSBz
dGFydCBjYWxsIGZyb20gc29tZSBvdGhlciBDUFUKPiA+IDIpIFVwb24gcmVzdW1pbmcgZnJvbSBu
b24tcmV0ZW50aXZlIFNCSSBIU00gc3VzcGVuZCBvcgo+ID4gICAgIFNCSSBzeXN0ZW0gc3VzcGVu
ZAo+ID4KPiA+IFRoZSBTLW1vZGUgZW50cnkgc3RhdGUgb2YgdGhlIGJvb3QgQ1BVIGlzIGRlZmlu
ZWQgYnkgdGhlCj4gPiBPUyBib290IHByb3RvY29sIGFuZCBub3QgYnkgdGhlIFNCSSBzcGVjLiBE
dWUgdG8gdGhpcywgcmVhc29uCj4gPiBLVk0gUklTQy1WIGV4cGVjdHMgdXNlci1zcGFjZSB0byBz
ZXQgdXAgdGhlIFMtbW9kZSBlbnRyeQo+ID4gc3RhdGUgb2YgdGhlIGJvb3QgQ1BVIHVwb24gc3lz
dGVtIHJlc2V0Lgo+Cj4gV2UgY2FuIGhhbmRsZSB0aGUgaW5pdGlhbCBzdGF0ZSBjb25zaXN0ZW5j
eSBpbiBvdGhlciBwYXRjaGVzLgo+IFdoYXQgbmVlZHMgYWRkcmVzc2luZyBpcyBhIHdheSB0byB0
cmlnZ2VyIHRoZSBLVk0gcmVzZXQgZnJvbSB1c2Vyc3BhY2UsCj4gZXZlbiBpZiBvbmx5IHRvIGNs
ZWFyIHRoZSBpbnRlcm5hbCBLVk0gc3RhdGUuCj4KPiBJIHRoaW5rIG1wX3N0YXRlIGlzIGN1cnJl
bnRseSB0aGUgYmVzdCBzaWduYWxpemF0aW9uIHRoYXQgS1ZNIHNob3VsZAo+IHJlc2V0LCBzbyBJ
IGFkZGVkIGl0IHRoZXJlLgo+Cj4gV2hhdCB3b3VsZCBiZSB5b3VyIHByZWZlcnJlZCBpbnRlcmZh
Y2UgZm9yIHRoYXQ/Cj4KCkluc3RlYWQgb2YgY3JlYXRpbmcgYSBuZXcgaW50ZXJmYWNlLCBJIHdv
dWxkIHByZWZlciB0aGF0IFZDUFUKd2hpY2ggaW5pdGlhdGVzIFNCSSBTeXN0ZW0gUmVzZXQgc2hv
dWxkIGJlIHJlc2V0dGVkIGltbWVkaWF0ZWx5CmluLWtlcm5lbCBzcGFjZSBiZWZvcmUgZm9yd2Fy
ZGluZyB0aGUgc3lzdGVtIHJlc2V0IHJlcXVlc3QgdG8KdXNlciBzcGFjZS4gVGhpcyB3YXkgd2Ug
YWxzbyBmb3JjZSBLVk0gdXNlci1zcGFjZSB0byBleHBsaWNpdGx5CnNldCB0aGUgUEMsIEEwLCBh
bmQgQTEgYmVmb3JlIHJ1bm5pbmcgdGhlIFZDUFUgYWdhaW4gYWZ0ZXIKc3lzdGVtIHJlc2V0LgoK
UmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9rdm0tcmlzY3YK
