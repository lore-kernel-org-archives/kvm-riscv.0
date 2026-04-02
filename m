Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BFED39434
	for <kvm-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 14:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3BJ5mrvAmguhljXPMqI278g5S8dZCNz5hCA+CzDYzU=; b=H+ndFk8P5aUNBb
	AzwHO90pGemE/lXldUsLvvYTcIk8wyEv6Xz6vKZE1edYcwTqJyad0gSR17DxndJ4iMHmmO2LKmjNV
	3Sagx7gUmlKY5va9q/oIXR3H/MJmtMBhq8sKHMRtO0KAVXlg6SIgggKyo5FrxJNPEeqbe+THPG3cg
	bzEQ23Ear9+WCBEaof0LbwdYywX0TKJuxMAEjB+a0EuF/mf647mOrsZc6N0GasiLqTO53hFrgdgN5
	g0xfWTYzXdFjHntA/LnFTq6ChruKj6jCOb6gMKnM8rysKKhMydSd9AJYH0EtBJINDuj/7Wd1VLV+B
	hNKUMhQC0V+/GZPr5S5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JDq-00000000McO-48Mj;
	Thu, 02 Apr 2026 14:40:39 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JDo-00000000MbT-28TE
	for kvm-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 14:40:37 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-67e23011c93so348139eaf.3
        for <kvm-riscv@lists.infradead.org>; Thu, 02 Apr 2026 07:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775140835; cv=none;
        d=google.com; s=arc-20240605;
        b=VXppydEsLHlmZh30/jbm/NeS+nfNPRSSfTTecaghSA6UoNOWRN68G+kO/2W7k4Cra2
         tFVirnvgLFjmx8s2FMIyaRP3SiM7VoCjfEa13uP2ekq25oR7l/BcG4RKmFt9/J65UNPK
         bl+xyiCwvOKqvGmqnWpHM5IqAKcJwcK7mv2rfUwL7ZbyEPUrmWHoQHjI60p+Qvwvvn4a
         qvK1yS5qSL5s6DJgp8uqRq4FTpXXzFf8oLc4zOKSWEMd8y667iSKn2N0Rr1JcJhp1dRr
         koKRpTDDVYDe1GTzhyPnU0wUuS3FOtL36OM2p42v4rxkT69GLGK1FDZyHIqQNOcWHqsm
         pP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CgXVgNr9LcoHCMvR/4QMuJnwtL2EPpKXdJ8rG5+UP24=;
        fh=Pav1ti6Idfs/EmOMXcy+T41vmrn3mESy6dOfR5CssR0=;
        b=jKYiFMN63Mgw2k5ZpnFUL1JbEOJYz0lxpaHmnY9n0w2gxHfF62NWkzI1bz8fh0WQvm
         +qEMsHNFUeNhJEcARKnk+emJDptPwOGsCY66nHNdB9G3WmZQVIzzxj/MjTTBgk0CYp3I
         8PSig9xVawZVJLgh36vCrq7dAAExw0OOJ776qlT7ggrrduFuyaDPTEEjoyGCif0iULQa
         558+Z2j6U8llbKLiONpVB55yK+oJ14eityHBUf29RmD1mHIUavRaZAQEPW+lSyqy2ZHf
         uc5bOjyw1Cu+CT38mkdjVXLJd8RK/fUGNovM+DO1t0n2Qn1IbCW0xDzC6p9jTYskqEtx
         sL4Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1775140835; x=1775745635; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgXVgNr9LcoHCMvR/4QMuJnwtL2EPpKXdJ8rG5+UP24=;
        b=P+JXMoj32E8c0bZMj7bun6rXV5wXErZ2WengQYL540up0fKqljwta1bn8aS7viukdr
         pIoVUFBO5Sl+e/kyrwpY7/89cXQlEdgxX5RvIn1PG01zfpkHt63Tvg2eKueSzBrHWAUc
         SZmj5O5F2MMkMRWvsyLLpptL3wp3zyybni/p91Z8AvYB0fWuIbl0AtO7fW8IH+vQnsiB
         s6YGGxLFFCr5Lyb/GKAJBENjTl+qosOy074qaJYIWTtnXvi1J2dwYqclmyc9MR/SFq/x
         XfSHhUU8e7XTEm452PkBImv1lgjoT2xahtCs1brQV+OfznKDT10SDIQtYm9EmfKJ2Cn8
         6SJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775140835; x=1775745635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CgXVgNr9LcoHCMvR/4QMuJnwtL2EPpKXdJ8rG5+UP24=;
        b=cd7qxzZ+3N1HLAcNux7C0WRV9phq2NW3YlLahMkMMgIWlHzzJMpMKgSXvUroJviq/y
         i3+cwdQUX38U31ma7FcUfYWVnKI2RLqJ2tb9VZGykwdG1lYFNF59cV+4lf35sUevIimg
         yI+cDbSBTznMyNJn7Co/5rt7b+lb891izX86tMp1kTXjr1k9rHsunPAfV6y0lKmGtI/g
         ONOg9Kxh8RiVhJGtZzWk+amTevzil2axESai5MCVLxB5biK/l9lnKr/vZePavAPnnMqu
         gxPU8ttrO7RrV/vbLPogNyei7Exe8ir6z3D/oKpuWqPt4hoAbUEFjpIxRBdHOgFRlKdx
         XWvg==
X-Forwarded-Encrypted: i=1; AJvYcCUmGYmaqvqKjQglUrhdPftV3vkDQkHvPaztxmunbaypZSddyijv/NF81OfbQXyOXNNzY8dtfd1X7Lo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjw8w9aXQf57+ZiCilNgeAE7YQOePyEyZSxDpOf0M3GRBtvfUd
	aZGB2NKj7HAvrPI7Cctb2fLowoOmThqT18lalb9vNKq1c49TorM4BXdFYtzCzXyo2nSZNgXoKJE
	qm6XovOVsfGN2PctdoEFV9VNHkKnaWPREkyfEtHGzcw==
X-Gm-Gg: ATEYQzzAawRwOKImxPDPJ5O7QDVFyE23vBGYxptoiMTAy5da8lFYXBnYrQYG2f2NOTJ
	TMRD8EQr4hQ5ADg+uFDya2UNoSeMn4LphMRvsQ8K2HAiclgIQ6PADYUJBcAkl0tw4cH0MpkyBwC
	vbBsHqraYz7NPhCooPaF616fGqrSzYomTZ1+EShYeWoDQ5GrbttYNNY0U9BVFcSiHbQVlMPgWgD
	9SoLKfsjfv8xt+HxBtZhUX08zFZNBowLXuhAU4tZr02tRMJX6j4souzJ9KRys23vqt/FIWGyVox
	dunQgafCS9TKb31jkTCOzjgPca0LB0uDcs1ieVLIb6hohjnwsYtzabi5ETcovPOE2krpx/W3vd4
	Ikpe8+BaZi8Zb2g9OPqr1SkUg9Q==
X-Received: by 2002:a05:6820:828:b0:67e:244a:7dd5 with SMTP id
 006d021491bc7-67fabcd8e2dmr3743192eaf.51.1775140835100; Thu, 02 Apr 2026
 07:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260402132303.6252-1-fangyu.yu@linux.alibaba.com> <20260402132303.6252-4-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260402132303.6252-4-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Apr 2026 20:10:23 +0530
X-Gm-Features: AQROBzDhVdJ-Rk6tIUeOmOBsDek_WXlm04aASx05OVR5rTbB0T6p0wGRWJFy36Q
Message-ID: <CAAhSdy3fVrw+=TgtgttQwnjUBy2s4OdhNcKZ+wK8pJFDi+Y89A@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] RISC-V: KVM: Detect and expose supported HGATP
 G-stage modes
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	skhan@linuxfoundation.org, guoren@kernel.org, radim.krcmar@oss.qualcomm.com, 
	andrew.jones@oss.qualcomm.com, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_074036_645505_0BF2C44A 
X-CRM114-Status: GOOD (  19.43  )
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

T24gVGh1LCBBcHIgMiwgMjAyNiBhdCA2OjUz4oCvUE0gPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4KPgo+IEV4dGVuZCBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfZGV0ZWN0KCkgdG8gcmVjb3Jk
IEhHQVRQLk1PREUgdmFsdWVzIGluIGEKPiBiaXRtYXNrLiBLZWVwIHRyYWNraW5nIHRoZSBtYXhp
bXVtIHN1cHBvcnRlZCBHLXN0YWdlIHBhZ2UgdGFibGUgbGV2ZWwKPiBmb3IgZXhpc3RpbmcgaW50
ZXJuYWwgdXNlcnMuCj4KPiBBbHNvIHByb3ZpZGUgbGlnaHR3ZWlnaHQgaGVscGVycyB0byByZXRy
aWV2ZSB0aGUgc3VwcG9ydGVkLW1vZGUgYml0bWFzawo+IGFuZCB2YWxpZGF0ZSBhIHJlcXVlc3Rl
ZCBIR0FUUC5NT0RFIGFnYWluc3QgaXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBGYW5neXUgWXUgPGZh
bmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxh
bmRyZXcuam9uZXNAb3NzLnF1YWxjb21tLmNvbT4KPiBSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3Vv
cmVuQGtlcm5lbC5vcmc+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20va3ZtX2dzdGFnZS5oIHwgMTEgKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9rdm0vZ3N0YWdl
LmMgICAgICAgICAgICAgfCAxNSArKysrKysrKysrKystLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAy
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
Z3N0YWdlLmgKPiBpbmRleCA3MGQ5ZDQ4MzM2NWUuLmJiZjhmNDVjNjU2MyAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaAo+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oCj4gQEAgLTMxLDYgKzMxLDcgQEAgc3RydWN0IGt2bV9n
c3RhZ2VfbWFwcGluZyB7Cj4gICNlbmRpZgo+Cj4gIGV4dGVybiB1bnNpZ25lZCBsb25nIGt2bV9y
aXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHM7Cj4gK2V4dGVybiB1MzIga3ZtX3Jpc2N2X2dzdGFn
ZV9zdXBwb3J0ZWRfbW9kZV9tYXNrOwo+Cj4gICNkZWZpbmUga3ZtX3Jpc2N2X2dzdGFnZV9wZ2Rf
eGJpdHMgICAgIDIKPiAgI2RlZmluZSBrdm1fcmlzY3ZfZ3N0YWdlX3BnZF9zaXplICAgICAgKDFV
TCA8PCAoSEdBVFBfUEFHRV9TSElGVCArIGt2bV9yaXNjdl9nc3RhZ2VfcGdkX3hiaXRzKSkKPiBA
QCAtMTAyLDQgKzEwMywxNCBAQCBzdGF0aWMgaW5saW5lIHZvaWQga3ZtX3Jpc2N2X2dzdGFnZV9p
bml0KHN0cnVjdCBrdm1fZ3N0YWdlICpnc3RhZ2UsIHN0cnVjdCBrdm0gKgo+ICAgICAgICAgZ3N0
YWdlLT5wZ2RfbGV2ZWxzID0ga3ZtLT5hcmNoLnBnZF9sZXZlbHM7Cj4gIH0KPgo+ICtzdGF0aWMg
aW5saW5lIHUzMiBrdm1fcmlzY3ZfZ2V0X2hnYXRwX21vZGVfbWFzayh2b2lkKQo+ICt7Cj4gKyAg
ICAgICByZXR1cm4ga3ZtX3Jpc2N2X2dzdGFnZV9zdXBwb3J0ZWRfbW9kZV9tYXNrOwo+ICt9Cj4g
Kwo+ICtzdGF0aWMgaW5saW5lIGJvb2wga3ZtX3Jpc2N2X2hnYXRwX21vZGVfaXNfdmFsaWQodW5z
aWduZWQgbG9uZyBtb2RlKQo+ICt7Cj4gKyAgICAgICByZXR1cm4ga3ZtX3Jpc2N2X2dzdGFnZV9z
dXBwb3J0ZWRfbW9kZV9tYXNrICYgQklUKG1vZGUpOwo+ICt9Cj4gKwo+ICAjZW5kaWYKPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMgYi9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2Uu
Ywo+IGluZGV4IDdjNGMzNGJjMTkxYi4uOTIwNGU2NDI3ZDJkIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva3ZtL2dzdGFnZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMKPiBAQCAt
MTYsNiArMTYsOCBAQCB1bnNpZ25lZCBsb25nIGt2bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZl
bHMgX19yb19hZnRlcl9pbml0ID0gMzsKPiAgI2Vsc2UKPiAgdW5zaWduZWQgbG9uZyBrdm1fcmlz
Y3ZfZ3N0YWdlX21heF9wZ2RfbGV2ZWxzIF9fcm9fYWZ0ZXJfaW5pdCA9IDI7Cj4gICNlbmRpZgo+
ICsvKiBCaXRtYXNrIG9mIHN1cHBvcnRlZCBIR0FUUC5NT0RFIGVuY29kaW5ncyAoQklUKEhHQVRQ
X01PREVfKikpLiAqLwo+ICt1MzIga3ZtX3Jpc2N2X2dzdGFnZV9zdXBwb3J0ZWRfbW9kZV9tYXNr
IF9fcm9fYWZ0ZXJfaW5pdDsKPgo+ICAjZGVmaW5lIGdzdGFnZV9wdGVfbGVhZihfX3B0ZXApICAg
ICAgICBcCj4gICAgICAgICAocHRlX3ZhbCgqKF9fcHRlcCkpICYgKF9QQUdFX1JFQUQgfCBfUEFH
RV9XUklURSB8IF9QQUdFX0VYRUMpKQo+IEBAIC0zMTcsMTEgKzMxOSwxNyBAQCB2b2lkIGt2bV9y
aXNjdl9nc3RhZ2Vfd3BfcmFuZ2Uoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwgZ3BhX3Qgc3Rh
cnQsIGdwYV90IGVuZAo+Cj4gIHZvaWQgX19pbml0IGt2bV9yaXNjdl9nc3RhZ2VfbW9kZV9kZXRl
Y3Qodm9pZCkKPiAgewo+ICsgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9zdXBwb3J0ZWRfbW9kZV9t
YXNrID0gMDsKPiArICAgICAgIGt2bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHMgPSAwOwo+
ICsKPiAgI2lmZGVmIENPTkZJR182NEJJVAo+ICAgICAgICAgLyogVHJ5IFN2NTd4NCBHLXN0YWdl
IG1vZGUgKi8KPiAgICAgICAgIGNzcl93cml0ZShDU1JfSEdBVFAsIEhHQVRQX01PREVfU1Y1N1g0
IDw8IEhHQVRQX01PREVfU0hJRlQpOwo+ICAgICAgICAgaWYgKChjc3JfcmVhZChDU1JfSEdBVFAp
ID4+IEhHQVRQX01PREVfU0hJRlQpID09IEhHQVRQX01PREVfU1Y1N1g0KSB7Cj4gICAgICAgICAg
ICAgICAgIGt2bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHMgPSA1Owo+ICsgICAgICAgICAg
ICAgICBrdm1fcmlzY3ZfZ3N0YWdlX3N1cHBvcnRlZF9tb2RlX21hc2sgfD0gQklUKEhHQVRQX01P
REVfU1Y1N1g0KSB8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBCSVQoSEdBVFBfTU9ERV9TVjQ4WDQpIHwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVChIR0FUUF9NT0RFX1NW
MzlYNCk7Cj4gICAgICAgICAgICAgICAgIGdvdG8gZG9uZTsKPiAgICAgICAgIH0KPgo+IEBAIC0z
MjksNiArMzM3LDggQEAgdm9pZCBfX2luaXQga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX2RldGVjdCh2
b2lkKQo+ICAgICAgICAgY3NyX3dyaXRlKENTUl9IR0FUUCwgSEdBVFBfTU9ERV9TVjQ4WDQgPDwg
SEdBVFBfTU9ERV9TSElGVCk7Cj4gICAgICAgICBpZiAoKGNzcl9yZWFkKENTUl9IR0FUUCkgPj4g
SEdBVFBfTU9ERV9TSElGVCkgPT0gSEdBVFBfTU9ERV9TVjQ4WDQpIHsKPiAgICAgICAgICAgICAg
ICAga3ZtX3Jpc2N2X2dzdGFnZV9tYXhfcGdkX2xldmVscyA9IDQ7Cj4gKyAgICAgICAgICAgICAg
IGt2bV9yaXNjdl9nc3RhZ2Vfc3VwcG9ydGVkX21vZGVfbWFzayB8PSBCSVQoSEdBVFBfTU9ERV9T
VjQ4WDQpIHwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEJJVChIR0FUUF9NT0RFX1NWMzlYNCk7Cj4gICAgICAgICAgICAgICAgIGdvdG8g
ZG9uZTsKPiAgICAgICAgIH0KPgo+IEBAIC0zMzYsNiArMzQ2LDcgQEAgdm9pZCBfX2luaXQga3Zt
X3Jpc2N2X2dzdGFnZV9tb2RlX2RldGVjdCh2b2lkKQo+ICAgICAgICAgY3NyX3dyaXRlKENTUl9I
R0FUUCwgSEdBVFBfTU9ERV9TVjM5WDQgPDwgSEdBVFBfTU9ERV9TSElGVCk7Cj4gICAgICAgICBp
ZiAoKGNzcl9yZWFkKENTUl9IR0FUUCkgPj4gSEdBVFBfTU9ERV9TSElGVCkgPT0gSEdBVFBfTU9E
RV9TVjM5WDQpIHsKPiAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9tYXhfcGdkX2xl
dmVscyA9IDM7Cj4gKyAgICAgICAgICAgICAgIGt2bV9yaXNjdl9nc3RhZ2Vfc3VwcG9ydGVkX21v
ZGVfbWFzayB8PSBCSVQoSEdBVFBfTU9ERV9TVjM5WDQpOwo+ICAgICAgICAgICAgICAgICBnb3Rv
IGRvbmU7Cj4gICAgICAgICB9Cj4gICNlbHNlIC8qIENPTkZJR18zMkJJVCAqLwo+IEBAIC0zNDMs
MTMgKzM1NCwxMSBAQCB2b2lkIF9faW5pdCBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfZGV0ZWN0KHZv
aWQpCj4gICAgICAgICBjc3Jfd3JpdGUoQ1NSX0hHQVRQLCBIR0FUUF9NT0RFX1NWMzJYNCA8PCBI
R0FUUF9NT0RFX1NISUZUKTsKPiAgICAgICAgIGlmICgoY3NyX3JlYWQoQ1NSX0hHQVRQKSA+PiBI
R0FUUF9NT0RFX1NISUZUKSA9PSBIR0FUUF9NT0RFX1NWMzJYNCkgewo+ICAgICAgICAgICAgICAg
ICBrdm1fcmlzY3ZfZ3N0YWdlX21heF9wZ2RfbGV2ZWxzID0gMjsKPiArICAgICAgICAgICAgICAg
a3ZtX3Jpc2N2X2dzdGFnZV9zdXBwb3J0ZWRfbW9kZV9tYXNrIHw9IEJJVChIR0FUUF9NT0RFX1NW
MzJYNCk7Cj4gICAgICAgICAgICAgICAgIGdvdG8gZG9uZTsKPiAgICAgICAgIH0KPiAgI2VuZGlm
Cj4KPiAtICAgICAgIC8qIEtWTSBkZXBlbmRzIG9uICFIR0FUUF9NT0RFX09GRiAqLwo+IC0gICAg
ICAga3ZtX3Jpc2N2X2dzdGFnZV9tYXhfcGdkX2xldmVscyA9IDA7Cj4gLQo+ICBkb25lOgo+ICAg
ICAgICAgY3NyX3dyaXRlKENTUl9IR0FUUCwgMCk7Cj4gICAgICAgICBrdm1fcmlzY3ZfbG9jYWxf
aGZlbmNlX2d2bWFfYWxsKCk7Cj4gLS0KPiAyLjUwLjEKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5n
IGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
