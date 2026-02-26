Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BA5F55450
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 06:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4NfWxfJ9Us6KpJLNbQmAMr0Abd7jb6Uj+5oVksdTbs=; b=WJ+4dE3SjttsbC
	HxVsFdKMgUmG4aYOgfIlOFVoHnxkxd4StOiejRbSzpnDfkFidcsbU5UWxDMBY5ueUFXV5+jJABARs
	QTfvX/ZJEwmpBVq5gwZ4etyEwesCO2J0x2nAweYVTYoteXkiZdJKWIgFLhc6xYI/xc5bxAZKVzeG1
	w5YhxGyPe+8CKGnIqa/z7nS+Np7FWZUmulgCLDXbQq3DA29leeMYxrxEZMq3QXjJg+rK161/Mn8RH
	FfhkCocNEYPAcsObb3OtxWNy4pgBau861Ll4I9DJ9EiNyhjW4tBPerUHtXV1CczRfDA1fJyeXmszF
	drkXRng9y4/5glxDjxXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUQ4-00000005SnR-2q18;
	Thu, 26 Feb 2026 06:00:16 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUQ2-00000005Smi-1jbT
	for kvm-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 06:00:15 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-662f9aeb782so424909eaf.3
        for <kvm-riscv@lists.infradead.org>; Wed, 25 Feb 2026 22:00:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772085613; cv=none;
        d=google.com; s=arc-20240605;
        b=Su4/o0eLelqB4g8Vor+3JDz93acb+reAzM6rC+4y1oFlXnON5eVxPfs9mQnYWyeXkf
         39fEBbl3CYJSnerYJX3e5W0OCJ37OJNW2uan+rQ8FnGotoPRWGP5+rrRgw0Ji+Ao8p/T
         /fVCZbh9KuOLaTCIFDqDrCEW7TdwUChnKsw2UlsigLj/ncfs8WOWjQbzo2HY0T1LI1Qv
         uSxB3ex5gpuxD0aUHrQVvQSSPy70vnI9dREEqghoqfdopoDvE9MVo7ai0aefCH1mQalf
         S6o3hxM1L2HtMPQlAW0VYD6vQGrZsebz/oJewz3SFUCGhDrhLGaOrDuEZZBxPZn9HoFP
         YL5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aaBkiCbKFk+jtOcOhydSv18/ATIpNF+APtbum9WdzSk=;
        fh=ozBX1YqQhsH706Aki3MyYWhtZbWzujTDNMQYHi3aXLE=;
        b=WbUGr36k0DfaCnrSmBU/T5W6fx9ri+nopz5he1N0yzFk7U7HxA8M64kuXLb1rG3X3y
         9IOiBebup93p1udUibj3BtsMY0c9+6KUfQiG82+e0y+LkQHvZyObGu2Ae3z9aL37AhrP
         60K/aLX6VvRaTjLUayBWf3z/mm9xqRf4i+XI8/nW/Kv0JzNHVc5DPqL0Pg3COqSW6i+/
         IJ3ybpMZOytdgZOtPO48CpG6Yytgmm3KPyPe9wS2m+yJIgeG+sajR+dMopwWJmf02ciU
         3HOgkMAn5y1NttZh1ZxLLLQckjTxciDqfHbzupxDwWsKgDD7q1ntoVNw4pLFykfT47hk
         11Mg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772085613; x=1772690413; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaBkiCbKFk+jtOcOhydSv18/ATIpNF+APtbum9WdzSk=;
        b=KIEZilES100la2hVeWgC/0pYF/i34K0eKfCkniaRn0PiDWoVhM2hD5mjSc/D41tFVs
         PiOLPPZ+dy8rr+h6mUTwi3loXaB8Oq3mJf8L25QClPyMogpiUrES84jkNJb2fUfpOlMS
         vE0mP12iORcW4O4GJyh6NJIStArsl2moWEgaGCvLnydOaaGCpRFgKZu6qPrw38LTP8nk
         VJAeiM5HNteJFadlj2oVyvGirGdH2wwS/JNHTpBZkfEpdjBirSB9SQA99ggqVLAqHZiM
         cTcJVRw9ifq6dQD9jCBDhvRfQxAzGterO9FPhUmJuQRDe2S8Jvt2aJbwEdbf0q3oER5S
         atVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772085613; x=1772690413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aaBkiCbKFk+jtOcOhydSv18/ATIpNF+APtbum9WdzSk=;
        b=pC1/vl+q+WLva8GqfSCl7HKc/MCml+MoFRPWsj15/npmY8cYVLuvFMASi9ZlQkX8Lk
         hMN3jUmwzaEnXfxjOaNEpDXpg08bb88EpgtiWn8/aLUI0rXTcZJ5c+Wby8H2kps9EwI8
         qpyI8+LBXeu0d7Lm7jE3fME12Wz7sVAAJdRBkZA3EYhRk74cXjXyuGQoWd9H6ocJTIAD
         H7ZNPWSgFB+hYW8/9Wjwrz4BV8FTnz0QcLFsRd07YkY+6Gs3xkZhRDb127EBpwzkpDBw
         Jb/JJac4BhbD2SSp/2/AK54+OzyMvveywO1FYdyvRbjwTkrwWEaQDXBD/+s/QS8hlZu0
         DBtg==
X-Forwarded-Encrypted: i=1; AJvYcCVNXrIo2L7teGS1JMPnnfvEeXftJLl0qQaCwX1S5s5msnjol0WPFu7URGYkaSDr1Z8MRZV3cr8xfhM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzniU5nQYkZY3SZx8ZLYHhFc++s78Cvvm4k2Rqm5Wz6gMgf9VJi
	RMk6SIShvnkRM86dLSv6F/Jy0bqtBftT3QqEzKRGcF5IQYmU0QLS6FmtRnsYp6+NhcN5jTfy697
	MpoiY0TPgXnmLrrioqc3qDFvgJD/3EikD468oyk205g==
X-Gm-Gg: ATEYQzxsRe9JKuhW0dz0488SztDUO1EaxlxpYbB3rjvBH1ZUB2DMLjgAeHhMwcHJRH1
	7M9b/M3DrNNwiSztJfk4FEJBEnus84+Auq03YzLAIqO/yJOBoJXI0nuvHXK3rIzD7InXQxGYrDZ
	k79bOYacRDrUDXI0Rvx1K+rQpiqxL3rQ3rY8WR6C5RzOrEFxKdIbgrFV3+GgEUlicMEYJ0+KzkN
	FGPSDZOiYHom48ZRAuuBEsacD9hq4SaGn8yshFb3y0UYsZmI8SMZMRq4IexRj+3bLEzbPVNObEn
	eOXnyWSIRYQduXnIZqONzjDiqFd+yAMnMXpa9nkUPfV/I0o31EEag6sdRH7wvIBpCOYPwKFhITB
	nuO1FTk9NyeVwGzTIwnmnTfWk2vo=
X-Received: by 2002:a05:6820:4611:b0:679:9646:69c1 with SMTP id
 006d021491bc7-679c47190e0mr7255747eaf.74.1772085612488; Wed, 25 Feb 2026
 22:00:12 -0800 (PST)
MIME-Version: 1.0
References: <20260130101557.1314385-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260130101557.1314385-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 26 Feb 2026 11:30:00 +0530
X-Gm-Features: AaiRm512q56kQGlC9Rn6Aq0NKfEpD-2Lh4341PKjku_mYqRwWUtpAEUYZ2k0hbU
Message-ID: <CAAhSdy2e4UYBRfU_m6RX-pWBBEv+Wu2Sqngg05FEG195odwhNw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_vcpu_aia_rmw_topei()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atish.patra@linux.dev>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_220014_826491_9D7888C8 
X-CRM114-Status: GOOD (  19.22  )
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

T24gRnJpLCBKYW4gMzAsIDIwMjYgYXQgMzo0NuKAr1BNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IGt2bV9yaXNjdl92Y3B1X2FpYV9ybXdfdG9wZWkoKSBh
c3N1bWVzIHRoYXQgdGhlIHBlci12Q1BVIElNU0lDIHN0YXRlIGhhcwo+IGJlZW4gaW5pdGlhbGl6
ZWQgb25jZSBBSUEgaXMgcmVwb3J0ZWQgYXMgYXZhaWxhYmxlIGFuZCBpbml0aWFsaXplZCBhdAo+
IHRoZSBWTSBsZXZlbC4gVGhpcyBhc3N1bXB0aW9uIGRvZXMgbm90IGFsd2F5cyBob2xkLgo+Cj4g
VW5kZXIgZnV6emVkIGlvY3RsIHNlcXVlbmNlcywgYSBndWVzdCBtYXkgYWNjZXNzIHRoZSBJTVNJ
QyBUT1BFSSBDU1IKPiBiZWZvcmUgdGhlIHZDUFUgSU1TSUMgc3RhdGUgaXMgc2V0IHVwLiBJbiB0
aGlzIGNhc2UsCj4gdmNwdS0+YXJjaC5haWFfY29udGV4dC5pbXNpY19zdGF0ZSBpcyBzdGlsbCBO
VUxMLCBhbmQgdGhlIFRPUEVJIFJNVyBwYXRoCj4gZGVyZWZlcmVuY2VzIGl0IHVuY29uZGl0aW9u
YWxseSwgbGVhZGluZyB0byBhIGhvc3Qga2VybmVsIGNyYXNoLgo+Cj4gVGhlIGNyYXNoIG1hbmlm
ZXN0cyBhczoKPiAgIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZp
cnR1YWwgYWRkcmVzcwo+ICAgZGZmZmZmZmYwMDAwMDAwZQo+ICAgLi4uCj4gICBrdm1fcmlzY3Zf
dmNwdV9haWFfaW1zaWNfcm13IGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jOjkwOQo+ICAga3Zt
X3Jpc2N2X3ZjcHVfYWlhX3Jtd190b3BlaSBhcmNoL3Jpc2N2L2t2bS9haWEuYzoyMzEKPiAgIGNz
cl9pbnNuIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jOjIwOAo+ICAgc3lzdGVtX29wY29kZV9p
bnNuIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jOjI4MQo+ICAga3ZtX3Jpc2N2X3ZjcHVfdmly
dHVhbF9pbnNuIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jOjM1NQo+ICAga3ZtX3Jpc2N2X3Zj
cHVfZXhpdCBhcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYzoyMzAKPiAgIGt2bV9hcmNoX3ZjcHVf
aW9jdGxfcnVuIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYzoxMDA4Cj4gICAuLi4KPgo+IEZpeCB0aGlz
IGJ5IGV4cGxpY2l0bHkgY2hlY2tpbmcgd2hldGhlciB0aGUgdkNQVSBJTVNJQyBzdGF0ZSBoYXMg
YmVlbgo+IGluaXRpYWxpemVkIGJlZm9yZSBoYW5kbGluZyBUT1BFSSBDU1IgYWNjZXNzZXMuIElm
IG5vdCwgZm9yd2FyZCB0aGUgQ1NSCj4gZW11bGF0aW9uIHRvIHVzZXIgc3BhY2UuCj4KPiBGaXhl
czogMmY0ZDU4Zjc2MzVhZSAoIlJJU0MtVjogS1ZNOiBWaXJ0dWFsaXplIHBlci1IQVJUIEFJQSBD
U1JzIikKPiBTaWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPHh1amlha2FpMjAyNUBpc2Nhcy5hYy5j
bj4KPiBTaWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPGppYWthaVBlYW51dEBnbWFpbC5jb20+Cj4g
LS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYS5jIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWEuYyBiL2Fy
Y2gvcmlzY3Yva3ZtL2FpYS5jCj4gaW5kZXggZGFkMzE4MTg1NjYwMC4uYzE3NmI5NjBkOGE0MCAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWEuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3Zt
L2FpYS5jCj4gQEAgLTIyOCw2ICsyMjgsMTAgQEAgaW50IGt2bV9yaXNjdl92Y3B1X2FpYV9ybXdf
dG9wZWkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgaWYgKCFrdm1fcmlzY3ZfYWlh
X2luaXRpYWxpemVkKHZjcHUtPmt2bSkpCj4gICAgICAgICAgICAgICAgIHJldHVybiBLVk1fSU5T
Tl9FWElUX1RPX1VTRVJfU1BBQ0U7Cj4KPiArICAgICAgIC8qIElmIElNU0lDIHZDUFUgc3RhdGUg
bm90IGluaXRpYWxpemVkIHRoZW4gZm9yd2FyZCB0byB1c2VyIHNwYWNlICovCj4gKyAgICAgICBp
ZiAoIXZjcHUtPmFyY2guYWlhX2NvbnRleHQuaW1zaWNfc3RhdGUpCj4gKyAgICAgICAgICAgICAg
IHJldHVybiBLVk1fSU5TTl9FWElUX1RPX1VTRVJfU1BBQ0U7Cj4gKwoKVGhpcyBzaG91bGQgYmUg
cGFydCBvZiBrdm1fcmlzY3ZfdmNwdV9haWFfaW1zaWNfcm13KCkuCgpBbHNvLCBGaXhlcyB0YWcg
c2hvdWxkIHBvaW50IHRvOgpkYjhiN2U5N2Q2MTM3ICgiUklTQy1WOiBLVk06IEFkZCBpbi1rZXJu
ZWwgdmlydHVhbGl6YXRpb24gb2YgQUlBIElNU0lDIikKCj4gICAgICAgICByZXR1cm4ga3ZtX3Jp
c2N2X3ZjcHVfYWlhX2ltc2ljX3Jtdyh2Y3B1LCBLVk1fUklTQ1ZfQUlBX0lNU0lDX1RPUEVJLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmFsLCBuZXdfdmFs
LCB3cl9tYXNrKTsKPiAgfQo+IC0tCj4gMi4zNC4xCj4KClJlZ2FyZHMsCkFudXAKCi0tIAprdm0t
cmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
