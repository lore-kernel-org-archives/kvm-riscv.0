Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04945CD5BD1
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYN/caUQSWFq84LTbXSIo/rcel4TLArDJ0/Z7jHi7v4=; b=bNNMLhTZAL35DX
	fSAhLI7uGOaojhMBF11YuKrx+VFdnX4B0xsP3Y1v089eStvdq/vTjbIQnIUTIdf/lwv+IbN+wYF1j
	ofMMvcqa9BjN8jG5mNOyvylyglZO+/C5pKZ3xlgtMeixpQVjO0aou2Kvjecjetgc66tp99pTlDtNl
	L0VNesQkMz3MTXTd7nXuR1Blm1ieqrLBlgGC924Z+QR2qC+OzkhBkBge2jWRx3qbTXRxjD0rSY1pC
	MZ2KUujZhR7g1xDr+T1BeGpYZmx+8/hX5YjqdOd/n0kTNd9hBU9S6Hy6JzT2nzikpbsjIDc+rd1CP
	O20D9IhRvImsv8o93oXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTy11-0000000AMHy-3Bfa;
	Mon, 01 Jun 2026 08:28:55 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTy0y-0000000AMGY-0Soc
	for kvm-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:28:53 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-69d862236ddso4912852eaf.0
        for <kvm-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780302531; cv=none;
        d=google.com; s=arc-20240605;
        b=HavCGKYp13D/6GAiDkYXXrgKGPG9hbaAovTMyYrx7J+PqqewFFhQYwf7zheGnu9PVi
         c3qU41e1bpbEn8uqvntOi/qHAOUzs+XxSJEgIfgLHa9vMDwZ4aA4hfJsmnA4m+41xMF8
         Twxsm7tk/VJxcJRfoGKOrf1r/rZD3CHe0lIAHuYvYlxKgGx/2lgdlKwxg1/TdY7M7i8s
         3qZIfBhu8UWR/jQRaen8jcTfEocAS0n+MY4jVOCaJhgIHoJgPQoTgeplH8Yxbp9k286G
         fQdXz1TafRko4n2v62at94fzt3WVQvQRIl6Oc7hjtxi4SpblidihfSVJbRhLdwQF07og
         e5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2ESq39BgNzEi4Yu/c7RvuT+HDwB/a0FKWuDwlbw5nEw=;
        fh=k2Fm7NX7ZF6wF4dtD/f8idq1nZfUYx06/vEzkrJMgro=;
        b=WckQOR3JRh0si/vrvSYHFZGkXkHrcMPkPUuwbXNBwaOudQ7xjYtw2jzdtIQNwc6Za/
         0GVxy6kNJwFnCtztHOP5sJwb78qhb9wFkhPrvzv+z22hUBGLAfA+URL0bWzNyTygaKSi
         spwjm34l6mlsYqt261iQFrQAhbW5rczhueMT5vgmJ7ok+irlLVPfrA8b5El5rF4YdH9a
         a0naVELAE4l86k8IpWTrHjGoh6+up+c3j7XexWHXgXfDrW3RpD5WtKqz0IxGarUhI7u5
         Q2qUcaZLxXsy3aNz7aS8L09FBMqtNCK/OirF4zDZWIt2odvJocoybi4KoY1ablgOe2vS
         A/Ng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780302531; x=1780907331; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ESq39BgNzEi4Yu/c7RvuT+HDwB/a0FKWuDwlbw5nEw=;
        b=LOggm9bAVLtTaXuMmoZgoUfUS1sTuk606+0G6xyEjkje/8P76YJGHSETUVLKI4rUPj
         kZW3Rl59aWGLFr66UiadffvN9yM7uakPujqP8uP5yhR+bbvIwk93wFssXqtANj6I1UE0
         8jSWxQRbL6QdAO2eRZDLND+3bZG8mJqjlvX3sNWzzUHpiEpoZaeqqoxyoNy5ZWEeRRcH
         bGHROy/uCFe8DsrIpTZXZjIBPmxHeKpjHbxsyqQ/Oj23ZuNnt9NgDiqdOZw9Q+zBZnHi
         QYcKsXnYR874jGF96o3EMiiF5I44O5jx2ZEVHf8jhfBfR+AvI+T7BWM9amzMc959Yxy0
         bDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780302531; x=1780907331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2ESq39BgNzEi4Yu/c7RvuT+HDwB/a0FKWuDwlbw5nEw=;
        b=TqAc4nIvQ9SO+opJv9hQ/kWi9/PJLtceX0IUirC2+kkQ6ZHQLf7bZKdfzy5cTwnYov
         WgtlWYkFZRotRv+k9XDw6r/ScH5SCD1BRhPjT7IG6CpJi0dAuZDweKoSQWAl1DnQ7Qq/
         IW38X8PANtUTMisP+ufA5DA2hU9i/qP9jwEGKiSVIKo5pIJwb+7bdZcGi2M6I0FOWSCl
         2dn0rjCWZ2x3x5FvhK1F/7oQ4xjm0U9FYmhw8IKdadl8dbHB4W2opa0jgV3uVyeYtYUt
         QHHT+WSXJK2G0CYh9qa9eT3kr/9ktXSJswyIKRZwsHH6cCmGhGGRyv7HzbPhbeYtXllN
         PmAg==
X-Forwarded-Encrypted: i=1; AFNElJ+UnMHpoTFI690pN+yw1Zjyu9GQNoHBb8ukgxuRgm3dTPzFa1OaJBc7fSDzKE7Uf1s+Df45onhPYGY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+uc8TcJodgJUgmSQlXw+C7NXrX2P7SecUdVMRLMa22MxFPz2o
	DG4ltDuqXXWdRlLsk7wdpfxro6gciUKUpQUz5N8r59oXoS3ulqDj7nOnYT+muA7nLk4HVP/5ihI
	Z8oLPiIYdcOscCngtqCMjbctBE8ccSmvChEqXXkrtNw==
X-Gm-Gg: Acq92OH0mIEg33csgO2ctqAM+QjQ7h5uo/2HGpsNzcggAJEB1freeGKzpmU9vDKhhy8
	u+VqOUSKEHCaNpk8co4K2rFI8trGCQ/f7moNdIFDDQinFA7iBs9Ctd4ld/iJMBcMLbfgzvTsmnY
	tXWnSyywprGSvmlxy4ArQQ3MXSw5YEkKy8Fi0Lrxi0n7lKv59T8yobvZvwJyfLYcHQSbt7QeD9v
	JXfF74zJOP7f0Vt6JYN/Lws+Xe7SeA32v8JzRNmCQGVi2+sHTb/jSNy5hnsJR6EJviO+LNk2jF0
	xEUuUPuJgJGWWxerXhVSrngxf2SP/sFa/C1sdQLGtlLntRPM9XFQgNk2UBJ1vksIE6OX9lqU6Kp
	VgbSb/mZK9XCoK+TAKHc8CRiMJKid7TZzlA6GPQ==
X-Received: by 2002:a05:6820:6ac2:b0:69d:79ff:d3b4 with SMTP id
 006d021491bc7-69e10403a78mr4828258eaf.7.1780302530944; Mon, 01 Jun 2026
 01:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260511032144.361520-1-rosenp@gmail.com>
In-Reply-To: <20260511032144.361520-1-rosenp@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Jun 2026 13:58:38 +0530
X-Gm-Features: AVHnY4IF73bShScS20qflmRSB7AeBeAPcEqSmcKeX3spZ09pNG9KxLbJgNe5j3s
Message-ID: <CAAhSdy34CXr4cky4cpg6eVV3FdwHvnR=pJqK=Y+ZsLLx0jL1_g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use flexible array for APLIC IRQ state
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-riscv@lists.infradead.org, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_012852_289009_7ECEC6A2 
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

T24gTW9uLCBNYXkgMTEsIDIwMjYgYXQgODo1MuKAr0FNIFJvc2VuIFBlbmV2IDxyb3NlbnBAZ21h
aWwuY29tPiB3cm90ZToKPgo+IFN0b3JlIHRoZSBwZXItc291cmNlIEFQTElDIElSUSBzdGF0ZSBp
biB0aGUgQVBMSUMgYWxsb2NhdGlvbiBpbnN0ZWFkCj4gb2YgYWxsb2NhdGluZyBpdCBzZXBhcmF0
ZWx5Lgo+Cj4gVGhpcyB0aWVzIHRoZSBJUlEgc3RhdGUgbGlmZXRpbWUgZGlyZWN0bHkgdG8gdGhl
IEFQTElDIHN0YXRlLCByZW1vdmVzIGEKPiBzZXBhcmF0ZSBhbGxvY2F0aW9uIGZhaWx1cmUgcGF0
aCwgYW5kIGxldHMgX19jb3VudGVkX2J5KCkgZGVzY3JpYmUgdGhlCj4gYXJyYXkgYm91bmRzLgo+
Cj4gQXNzaXN0ZWQtYnk6IENvZGV4OkdQVC01LjUKPiBTaWduZWQtb2ZmLWJ5OiBSb3NlbiBQZW5l
diA8cm9zZW5wQGdtYWlsLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51
cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjIKClRoYW5r
cywKQW51cAoKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jIHwgMTUgKysrLS0t
LS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jIGIvYXJjaC9y
aXNjdi9rdm0vYWlhX2FwbGljLmMKPiBpbmRleCAzNDY0ZjMzNTFkZjcuLjc0ODEwN2MzNDdkOSAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYwo+ICsrKyBiL2FyY2gvcmlz
Y3Yva3ZtL2FpYV9hcGxpYy5jCj4gQEAgLTM1LDcgKzM1LDcgQEAgc3RydWN0IGFwbGljIHsKPgo+
ICAgICAgICAgdTMyIG5yX2lycXM7Cj4gICAgICAgICB1MzIgbnJfd29yZHM7Cj4gLSAgICAgICBz
dHJ1Y3QgYXBsaWNfaXJxICppcnFzOwo+ICsgICAgICAgc3RydWN0IGFwbGljX2lycSBpcnFzW10g
X19jb3VudGVkX2J5KG5yX2lycXMpOwo+ICB9Owo+Cj4gIHN0YXRpYyB1MzIgYXBsaWNfcmVhZF9z
b3VyY2VjZmcoc3RydWN0IGFwbGljICphcGxpYywgdTMyIGlycSkKPiBAQCAtNTgxLDcgKzU4MSw3
IEBAIGludCBrdm1fcmlzY3ZfYWlhX2FwbGljX2luaXQoc3RydWN0IGt2bSAqa3ZtKQo+ICAgICAg
ICAgICAgICAgICByZXR1cm4gMDsKPgo+ICAgICAgICAgLyogQWxsb2NhdGUgQVBMSUMgZ2xvYmFs
IHN0YXRlICovCj4gLSAgICAgICBhcGxpYyA9IGt6YWxsb2Nfb2JqKCphcGxpYyk7Cj4gKyAgICAg
ICBhcGxpYyA9IGt6YWxsb2NfZmxleCgqYXBsaWMsIGlycXMsIGt2bS0+YXJjaC5haWEubnJfc291
cmNlcyArIDEpOwo+ICAgICAgICAgaWYgKCFhcGxpYykKPiAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FTk9NRU07Cj4gICAgICAgICBrdm0tPmFyY2guYWlhLmFwbGljX3N0YXRlID0gYXBsaWM7Cj4g
QEAgLTU4OSwxMSArNTg5LDYgQEAgaW50IGt2bV9yaXNjdl9haWFfYXBsaWNfaW5pdChzdHJ1Y3Qg
a3ZtICprdm0pCj4gICAgICAgICAvKiBTZXR1cCBBUExJQyBJUlFzICovCj4gICAgICAgICBhcGxp
Yy0+bnJfaXJxcyA9IGt2bS0+YXJjaC5haWEubnJfc291cmNlcyArIDE7Cj4gICAgICAgICBhcGxp
Yy0+bnJfd29yZHMgPSBESVZfUk9VTkRfVVAoYXBsaWMtPm5yX2lycXMsIDMyKTsKPiAtICAgICAg
IGFwbGljLT5pcnFzID0ga3phbGxvY19vYmpzKCphcGxpYy0+aXJxcywgYXBsaWMtPm5yX2lycXMp
Owo+IC0gICAgICAgaWYgKCFhcGxpYy0+aXJxcykgewo+IC0gICAgICAgICAgICAgICByZXQgPSAt
RU5PTUVNOwo+IC0gICAgICAgICAgICAgICBnb3RvIGZhaWxfZnJlZV9hcGxpYzsKPiAtICAgICAg
IH0KPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBhcGxpYy0+bnJfaXJxczsgaSsrKQo+ICAgICAg
ICAgICAgICAgICByYXdfc3Bpbl9sb2NrX2luaXQoJmFwbGljLT5pcnFzW2ldLmxvY2spOwo+Cj4g
QEAgLTYwNiw3ICs2MDEsNyBAQCBpbnQga3ZtX3Jpc2N2X2FpYV9hcGxpY19pbml0KHN0cnVjdCBr
dm0gKmt2bSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZhcGxpYy0+
aW9kZXYpOwo+ICAgICAgICAgbXV0ZXhfdW5sb2NrKCZrdm0tPnNsb3RzX2xvY2spOwo+ICAgICAg
ICAgaWYgKHJldCkKPiAtICAgICAgICAgICAgICAgZ290byBmYWlsX2ZyZWVfYXBsaWNfaXJxczsK
PiArICAgICAgICAgICAgICAgZ290byBmYWlsX2ZyZWVfYXBsaWM7Cj4KPiAgICAgICAgIC8qIFNl
dHVwIGRlZmF1bHQgSVJRIHJvdXRpbmcgKi8KPiAgICAgICAgIHJldCA9IGt2bV9yaXNjdl9zZXR1
cF9kZWZhdWx0X2lycV9yb3V0aW5nKGt2bSwgYXBsaWMtPm5yX2lycXMpOwo+IEBAIC02MTksOCAr
NjE0LDYgQEAgaW50IGt2bV9yaXNjdl9haWFfYXBsaWNfaW5pdChzdHJ1Y3Qga3ZtICprdm0pCj4g
ICAgICAgICBtdXRleF9sb2NrKCZrdm0tPnNsb3RzX2xvY2spOwo+ICAgICAgICAga3ZtX2lvX2J1
c191bnJlZ2lzdGVyX2Rldihrdm0sIEtWTV9NTUlPX0JVUywgJmFwbGljLT5pb2Rldik7Cj4gICAg
ICAgICBtdXRleF91bmxvY2soJmt2bS0+c2xvdHNfbG9jayk7Cj4gLWZhaWxfZnJlZV9hcGxpY19p
cnFzOgo+IC0gICAgICAga2ZyZWUoYXBsaWMtPmlycXMpOwo+ICBmYWlsX2ZyZWVfYXBsaWM6Cj4g
ICAgICAgICBrdm0tPmFyY2guYWlhLmFwbGljX3N0YXRlID0gTlVMTDsKPiAgICAgICAgIGtmcmVl
KGFwbGljKTsKPiBAQCAtNjM4LDggKzYzMSw2IEBAIHZvaWQga3ZtX3Jpc2N2X2FpYV9hcGxpY19j
bGVhbnVwKHN0cnVjdCBrdm0gKmt2bSkKPiAgICAgICAgIGt2bV9pb19idXNfdW5yZWdpc3Rlcl9k
ZXYoa3ZtLCBLVk1fTU1JT19CVVMsICZhcGxpYy0+aW9kZXYpOwo+ICAgICAgICAgbXV0ZXhfdW5s
b2NrKCZrdm0tPnNsb3RzX2xvY2spOwo+Cj4gLSAgICAgICBrZnJlZShhcGxpYy0+aXJxcyk7Cj4g
LQo+ICAgICAgICAga3ZtLT5hcmNoLmFpYS5hcGxpY19zdGF0ZSA9IE5VTEw7Cj4gICAgICAgICBr
ZnJlZShhcGxpYyk7Cj4gIH0KPiAtLQo+IDIuNTQuMAo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcg
bGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
