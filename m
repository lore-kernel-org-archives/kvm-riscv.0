Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EE610BA451
	for <kvm-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 09:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gkdf+v8p4JIhixq+9WtqUW/N7qr2vXFiDGkZuvRZQIY=; b=2SHd0twwYT0Ldn
	5TVbA5/3D/7z7dyLSiA5gDr9xwyjFXFhz5EnllSd42gHf0EQQhjRDzjTfWTZmIIBI9wuVcOfAGizv
	qq4BliHfXBXyZMcBwjbsFMn930JjxB4HSpXcz45JmYyZC4Q4p88Ppw8zdbhuw5oXS7AqgAX4gXuT1
	qPy0pcNMNzLoSzzDX1iRAQHkAwj+a0WYFK0nyf0bALWhV5RmbZZLEDl/2RLOhwM39eZLAIzoruTVQ
	Rqv2MFD3dZ66BXq3gY+FEqTnkyCVUuJ3oINX3WH9gziu5wgnsXsA0bNoLAIxslPr++ysUKyd4vKMi
	x6VQpMRU9NHIuiV7dvMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w633b-000000071aI-0BiP;
	Fri, 27 Mar 2026 09:00:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w633Z-000000071ZO-1GJ1
	for kvm-riscv@bombadil.infradead.org;
	Fri, 27 Mar 2026 09:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8iPzBqHCfL3LcH+hQY6MvdDgBGLsYlEG1twB6MOAX5Q=; b=lMlJEw+VNL9MDPyWT1FU7oOLR2
	W1tHFaNZw2MEpheBHk4pPVVeosJmwkZpbVjHY6gaXGM7B6vE5EUmXpsPt9YZwol3JuMObZT4PgtCM
	/eXJXCJKSzfg+04tsp8FbanMTl7fecqr5hFtu8pfz3JCFCARxYBpWzhlMDQPpljC8QkRgg9bw0HXG
	lN9XOQIa9V1YEsWKXaD3iYCnNVVf00Xcl06RjGwaw2SRl8nTMCQ0OZf2ONl0STqXmmtbWTtECdVmL
	hWOdSt1ztT45dT6jRiTZPyF1aJwXQWEphMWFsZns/UUL3S3YHgrGcMoG+WX8oLnoZTnePb5zJBZyI
	vHI8VmUg==;
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w633V-0000000A1ax-257B
	for kvm-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 09:00:39 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-67c20ed3076so1033367eaf.1
        for <kvm-riscv@lists.infradead.org>; Fri, 27 Mar 2026 02:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774602035; cv=none;
        d=google.com; s=arc-20240605;
        b=jdQYNeqRWdJk7dTyKi0Iio+jfO3b8AP0AOYjfZSjGT3lCPOpdhYgrjFvsyUh2/HxOt
         4LEVQ9xIHBXRMG0SyZoT6byNrnxSh2ViWqzEQYp3lLMItqcQOt+0CG1O+0cChq619N3Y
         CEqTqA08JZteLsNKpy+JHCzRO3fXwWSrZEQJN8idis94Ie5bxS8PMF6syf+u173rrKES
         5Q1QEetQdfC9Xfv52/B9VWivcKzfLluJVTqHXKR8gnLozzJ/VinA/Gx5/aTTuUQQ2dEV
         0r0hkP60qvUfk5WakirZilXn8CzBO202FJYXRFX3WXdKqf+J+NDlJFsYTWVJbYKCScNq
         LPrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8iPzBqHCfL3LcH+hQY6MvdDgBGLsYlEG1twB6MOAX5Q=;
        fh=lSV4dkGUxU3J0H5jhPFDOocg5HXkixrPKxABaxHaJhU=;
        b=aqKryKxykzrtuhBxccGeaSL3BWKrqFHmjdbUcGDVCpMOhATIYyZYkKm20oCgpXMgDb
         +1MxxKScuwl9NhPGtuHcYigww270YU9qPc9XjJsoF+crreFkixKateXyf5I7vW/CUGiK
         VMYwAg4EEIVumX6EDt79agsG0zqX+jsV92ujirs5f5OjloyUdsSx8r0fzABoGJTmicwE
         eGdy2mrWAbTkYKTA9oEAQKaZ5DI06mE/VkA7ON1Ii/VPS6m+svt3VU0CFsv29L+KLVS1
         /56po3NmR8f3hJsxjCsIAwM6fKzs9BaIZXFCz5Kwn0CtbQaYLYCTDOs+FjK/t9VlcOuy
         a0iw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774602035; x=1775206835; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iPzBqHCfL3LcH+hQY6MvdDgBGLsYlEG1twB6MOAX5Q=;
        b=xe/AZntk4vcok0qkJEKzIC7Y+k1uU6VKeXm2ZfpncqB8smFA4HeoY2PTqYR74JhsCM
         i+01KVarGEGfTTsH6fh+5gT7lG+d+n5veSobBZLp+dJNbvG8DAlFSpbk1IIKBAFgnTdi
         KI51slnP6/F+zUoxRDXboVRq2CQiMC+ryYnaO5dkS2x60j/6Xe6u998+nO60gY3OXb4P
         ojZXK7WWW8XkVQCH0r8mJipcPZASWH7Imem5mvUTRP0pxZLDA2VQetU95NXCB/1ZvqeI
         ylwXzNPIE3Z+owrn8BGr2z0z9yQckOfjE/u9CfEc6ijomeU9mxHc6xmFL9Bn2FJqAqR6
         mtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602035; x=1775206835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8iPzBqHCfL3LcH+hQY6MvdDgBGLsYlEG1twB6MOAX5Q=;
        b=j2l2f9hEqwBQXZS+rsKcEJw9fbmR9LCp1QYv103Ol/U/byu84bapPMJtn+IZkrn53o
         EeyPxcICyljy3jBiR7IK9kBiqo//gqNAkYkWaWdqeP/W6PHLaWIq5coyH9/MdAjNXktg
         GvHnAWv2ii3p9XOQhMqOb9CUXzr7M+soUX8/51qx9ml2ZN6lUu+WGWthQMajxNZeXb70
         1djawHRIOOJfpEyFn+e4UJZA8+mjczQM8b3s5mEYtiSU4ZTNSanznG0gTh6KLaTKG3SQ
         CqJ/HcBXZzqwNzWZRPj5hb9m5NmiW9jDS07k7Kqeoq1ba4xnNDxF2D562bwKfXbTED2a
         k26g==
X-Forwarded-Encrypted: i=1; AJvYcCUwOXit0riA3JMV2TZX+dsX2TyEiUzRchoTeqKLXWWe/ekXTwHtBldmEoZzOzL/IKtAMYeQ44YiOdQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2K61ggMAw0fZGkViP8d8ifXMB1TPAzkYSBf0kCP+0DvlOtdZC
	4/xYE4Vv9FgLkPr18gZdkBfQtGa/TjY+yg9sItZrNxBPBepxVxaVvYKSNqgveGIjcA7eyqT6zQr
	P8kJ07EZYPFBes47YVFQq3tCqXWt53yJARf0cw8I/Zw==
X-Gm-Gg: ATEYQzz6p0Zknyg2s2uumG1RAnMmM7PBDdRy1yOhCPqIt6uARG2F9UtZLxDvu9U974r
	fZ2F0VO25N/eOwzZePNzLlhCzWHqCrSk+jcFYP3qqisXjePysHR3gJ2NDc6PJATTSVu3sms2tWw
	Lg1F6IH3Y2OEhBYwwvGLQz4Re0OK8sSbP6/Q0ItfTolc7BgNzSw7f88oQTKTtB7U/izPg8IwRkx
	60vsmlT/fvRcezXdvWPS28JUPjEsv6dWo6i81Sil0z1vASgAsQTDXaOm7hDhTouBcTlyh+sgBtc
	NTN7li7fRxbLMhPDbD56rNsEznn2zQiEpbQmd0njI7G0Cf1aj30P3wWtROeGLHUXUZ3DE5Rvno6
	xvHLxy15uYP4desjCCfjMGCtD/w==
X-Received: by 2002:a05:6820:2294:b0:67c:2ad5:2b39 with SMTP id
 006d021491bc7-67e18641ffdmr874008eaf.23.1774602034585; Fri, 27 Mar 2026
 02:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2uMY+-9W34G3QJ3m9XWg2dq_PeNB_9j9B3viZaRg=SUQ@mail.gmail.com>
 <20260327015555.79223-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260327015555.79223-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Mar 2026 14:30:21 +0530
X-Gm-Features: AQROBzB6k39KBSA1bOcm2FYN_Hf1EsV9UtH0iPUVwF6t7ZS-vmzIB0bn1mfZeas
Message-ID: <CAAhSdy1-OPSaigBarUGmNWfcDBqjine+Hm+Urdinv1nLooQMNA@mail.gmail.com>
Subject: Re: Re: [PATCH v5 2/3] RISC-V: KVM: Detect and expose supported HGATP
 G-stage modes
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, 
	atish.patra@linux.dev, corbet@lwn.net, guoren@kernel.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org, 
	radim.krcmar@oss.qualcomm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_090037_703116_015DD54C 
X-CRM114-Status: GOOD (  23.47  )
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

T24gRnJpLCBNYXIgMjcsIDIwMjYgYXQgNzoyNuKAr0FNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gPj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxp
YmFiYS5jb20+Cj4gPj4KPiA+PiBFeHRlbmQga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX2RldGVjdCgp
IHRvIHByb2JlIGFsbCBIR0FUUC5NT0RFIHZhbHVlcwo+ID4+IHN1cHBvcnRlZCBieSB0aGUgaG9z
dCBhbmQgcmVjb3JkIHRoZW0gaW4gYSBiaXRtYXNrLiBLZWVwIHRyYWNraW5nIHRoZQo+ID4+IG1h
eGltdW0gc3VwcG9ydGVkIEctc3RhZ2UgcGFnZSB0YWJsZSBsZXZlbCBmb3IgZXhpc3RpbmcgaW50
ZXJuYWwgdXNlcnMuCj4gPj4KPiA+PiBBbHNvIHByb3ZpZGUgbGlnaHR3ZWlnaHQgaGVscGVycyB0
byByZXRyaWV2ZSB0aGUgc3VwcG9ydGVkLW1vZGUgYml0bWFzawo+ID4+IGFuZCB2YWxpZGF0ZSBh
IHJlcXVlc3RlZCBIR0FUUC5NT0RFIGFnYWluc3QgaXQuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5
OiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KPiA+PiAtLS0KPiA+PiAg
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmggfCAxMSArKysrKysrKwo+ID4+ICBh
cmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyAgICAgICAgICAgICB8IDQzICsrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tCj4gPj4gIDIgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMjAg
ZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rdm1fZ3N0YWdlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaAo+ID4+
IGluZGV4IGIxMjYwNWZiY2E0NC4uNzZjMzdiNWRjMDJkIDEwMDY0NAo+ID4+IC0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oCj4gPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1fZ3N0YWdlLmgKPiA+PiBAQCAtMzAsNiArMzAsNyBAQCBzdHJ1Y3Qga3ZtX2dz
dGFnZV9tYXBwaW5nIHsKPiA+PiAgI2VuZGlmCj4gPj4KPiA+PiAgZXh0ZXJuIHVuc2lnbmVkIGxv
bmcga3ZtX3Jpc2N2X2dzdGFnZV9tYXhfcGdkX2xldmVsczsKPiA+PiArZXh0ZXJuIHUzMiBrdm1f
cmlzY3ZfZ3N0YWdlX21vZGVfbWFzazsKPiA+Cj4gPnMvdTMyL3Vuc2lnbmVkIGxvbmcvCj4gPnMv
a3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX21hc2sva3ZtX3Jpc2N2X2dzdGFnZV9zdXBwb3J0ZWRfbW9k
ZV9tYXNrLwo+ID4KPgo+IEFjaywgd2lsbCBzd2l0Y2ggdGhlIHR5cGUgdG8gdW5zaWduZWQgbG9u
ZyBhbmQgcmVuYW1lIGl0IHRvCj4ga3ZtX3Jpc2N2X2dzdGFnZV9zdXBwb3J0ZWRfbW9kZV9tYXNr
IGluIHRoZSBuZXh0IHJldmlzaW9uLgo+Cj4gPj4KPiA+PiAgI2RlZmluZSBrdm1fcmlzY3ZfZ3N0
YWdlX3BnZF94Yml0cyAgICAgMgo+ID4+ICAjZGVmaW5lIGt2bV9yaXNjdl9nc3RhZ2VfcGdkX3Np
emUgICAgICAoMVVMIDw8IChIR0FUUF9QQUdFX1NISUZUICsga3ZtX3Jpc2N2X2dzdGFnZV9wZ2Rf
eGJpdHMpKQo+ID4+IEBAIC03NSw0ICs3NiwxNCBAQCB2b2lkIGt2bV9yaXNjdl9nc3RhZ2Vfd3Bf
cmFuZ2Uoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwgZ3BhX3Qgc3RhcnQsIGdwYV90IGVuZAo+
ID4+Cj4gPj4gIHZvaWQga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX2RldGVjdCh2b2lkKTsKPiA+Pgo+
ID4+ICtzdGF0aWMgaW5saW5lIHUzMiBrdm1fcmlzY3ZfZ2V0X2hnYXRwX21vZGVfbWFzayh2b2lk
KQo+ID4+ICt7Cj4gPj4gKyAgICAgICByZXR1cm4ga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX21hc2s7
Cj4gPj4gK30KPiA+PiArCj4gPj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBrdm1fcmlzY3ZfaGdhdHBf
bW9kZV9pc192YWxpZCh1bnNpZ25lZCBsb25nIG1vZGUpCj4gPj4gK3sKPiA+PiArICAgICAgIHJl
dHVybiBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfbWFzayAmIEJJVChtb2RlKTsKPiA+PiArfQo+ID4+
ICsKPiA+PiAgI2VuZGlmCj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5j
IGIvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMKPiA+PiBpbmRleCAyZDAwNDVmNTAyZDEuLjMyOGQ0
MTM4ZjE2MiAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+ID4+ICsr
KyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gPj4gQEAgLTE2LDYgKzE2LDggQEAgdW5zaWdu
ZWQgbG9uZyBrdm1fcmlzY3ZfZ3N0YWdlX21heF9wZ2RfbGV2ZWxzIF9fcm9fYWZ0ZXJfaW5pdCA9
IDM7Cj4gPj4gICNlbHNlCj4gPj4gIHVuc2lnbmVkIGxvbmcga3ZtX3Jpc2N2X2dzdGFnZV9tYXhf
cGdkX2xldmVscyBfX3JvX2FmdGVyX2luaXQgPSAyOwo+ID4+ICAjZW5kaWYKPiA+PiArLyogQml0
bWFzayBvZiBzdXBwb3J0ZWQgSEdBVFAuTU9ERSBlbmNvZGluZ3MgKEJJVChIR0FUUF9NT0RFXyop
KS4gKi8KPiA+PiArdTMyIGt2bV9yaXNjdl9nc3RhZ2VfbW9kZV9tYXNrIF9fcm9fYWZ0ZXJfaW5p
dDsKPiA+Pgo+ID4+ICAjZGVmaW5lIGdzdGFnZV9wdGVfbGVhZihfX3B0ZXApICAgICAgICBcCj4g
Pj4gICAgICAgICAocHRlX3ZhbCgqKF9fcHRlcCkpICYgKF9QQUdFX1JFQUQgfCBfUEFHRV9XUklU
RSB8IF9QQUdFX0VYRUMpKQo+ID4+IEBAIC0zMTUsNDIgKzMxNyw0MyBAQCB2b2lkIGt2bV9yaXNj
dl9nc3RhZ2Vfd3BfcmFuZ2Uoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwgZ3BhX3Qgc3RhcnQs
IGdwYV90IGVuZAo+ID4+ICAgICAgICAgfQo+ID4+ICB9Cj4gPj4KPiA+PiArc3RhdGljIGJvb2wg
X19pbml0IGt2bV9yaXNjdl9oZ2F0cF9tb2RlX3N1cHBvcnRlZCh1bnNpZ25lZCBsb25nIG1vZGUp
Cj4gPj4gK3sKPiA+PiArICAgICAgIGNzcl93cml0ZShDU1JfSEdBVFAsIG1vZGUgPDwgSEdBVFBf
TU9ERV9TSElGVCk7Cj4gPj4gKyAgICAgICByZXR1cm4gKChjc3JfcmVhZChDU1JfSEdBVFApID4+
IEhHQVRQX01PREVfU0hJRlQpID09IG1vZGUpOwo+ID4+ICt9Cj4gPj4gKwo+ID4+ICB2b2lkIF9f
aW5pdCBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfZGV0ZWN0KHZvaWQpCj4gPj4gIHsKPiA+PiArICAg
ICAgIGt2bV9yaXNjdl9nc3RhZ2VfbW9kZV9tYXNrID0gMDsKPiA+PiArICAgICAgIGt2bV9yaXNj
dl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHMgPSAwOwo+ID4+ICsKPiA+PiAgI2lmZGVmIENPTkZJR182
NEJJVAo+ID4+IC0gICAgICAgLyogVHJ5IFN2NTd4NCBHLXN0YWdlIG1vZGUgKi8KPiA+PiAtICAg
ICAgIGNzcl93cml0ZShDU1JfSEdBVFAsIEhHQVRQX01PREVfU1Y1N1g0IDw8IEhHQVRQX01PREVf
U0hJRlQpOwo+ID4+IC0gICAgICAgaWYgKChjc3JfcmVhZChDU1JfSEdBVFApID4+IEhHQVRQX01P
REVfU0hJRlQpID09IEhHQVRQX01PREVfU1Y1N1g0KSB7Cj4gPj4gLSAgICAgICAgICAgICAgIGt2
bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHMgPSA1Owo+ID4+IC0gICAgICAgICAgICAgICBn
b3RvIGRvbmU7Cj4gPj4gKyAgICAgICAvKiBUcnkgU3YzOXg0IEctc3RhZ2UgbW9kZSAqLwo+ID4+
ICsgICAgICAgaWYgKGt2bV9yaXNjdl9oZ2F0cF9tb2RlX3N1cHBvcnRlZChIR0FUUF9NT0RFX1NW
MzlYNCkpIHsKPiA+PiArICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX21hc2sg
fD0gQklUKEhHQVRQX01PREVfU1YzOVg0KTsKPiA+PiArICAgICAgICAgICAgICAga3ZtX3Jpc2N2
X2dzdGFnZV9tYXhfcGdkX2xldmVscyA9IDM7Cj4gPj4gICAgICAgICB9Cj4gPj4KPiA+PiAgICAg
ICAgIC8qIFRyeSBTdjQ4eDQgRy1zdGFnZSBtb2RlICovCj4gPj4gLSAgICAgICBjc3Jfd3JpdGUo
Q1NSX0hHQVRQLCBIR0FUUF9NT0RFX1NWNDhYNCA8PCBIR0FUUF9NT0RFX1NISUZUKTsKPiA+PiAt
ICAgICAgIGlmICgoY3NyX3JlYWQoQ1NSX0hHQVRQKSA+PiBIR0FUUF9NT0RFX1NISUZUKSA9PSBI
R0FUUF9NT0RFX1NWNDhYNCkgewo+ID4+ICsgICAgICAgaWYgKGt2bV9yaXNjdl9oZ2F0cF9tb2Rl
X3N1cHBvcnRlZChIR0FUUF9NT0RFX1NWNDhYNCkpIHsKPiA+PiArICAgICAgICAgICAgICAga3Zt
X3Jpc2N2X2dzdGFnZV9tb2RlX21hc2sgfD0gQklUKEhHQVRQX01PREVfU1Y0OFg0KTsKPiA+PiAg
ICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9tYXhfcGdkX2xldmVscyA9IDQ7Cj4gPj4g
LSAgICAgICAgICAgICAgIGdvdG8gZG9uZTsKPiA+PiAgICAgICAgIH0KPiA+Pgo+ID4+IC0gICAg
ICAgLyogVHJ5IFN2Mzl4NCBHLXN0YWdlIG1vZGUgKi8KPiA+PiAtICAgICAgIGNzcl93cml0ZShD
U1JfSEdBVFAsIEhHQVRQX01PREVfU1YzOVg0IDw8IEhHQVRQX01PREVfU0hJRlQpOwo+ID4+IC0g
ICAgICAgaWYgKChjc3JfcmVhZChDU1JfSEdBVFApID4+IEhHQVRQX01PREVfU0hJRlQpID09IEhH
QVRQX01PREVfU1YzOVg0KSB7Cj4gPj4gLSAgICAgICAgICAgICAgIGt2bV9yaXNjdl9nc3RhZ2Vf
bWF4X3BnZF9sZXZlbHMgPSAzOwo+ID4+IC0gICAgICAgICAgICAgICBnb3RvIGRvbmU7Cj4gPj4g
KyAgICAgICAvKiBUcnkgU3Y1N3g0IEctc3RhZ2UgbW9kZSAqLwo+ID4+ICsgICAgICAgaWYgKGt2
bV9yaXNjdl9oZ2F0cF9tb2RlX3N1cHBvcnRlZChIR0FUUF9NT0RFX1NWNTdYNCkpIHsKPiA+PiAr
ICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX21hc2sgfD0gQklUKEhHQVRQX01P
REVfU1Y1N1g0KTsKPiA+PiArICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9tYXhfcGdk
X2xldmVscyA9IDU7Cj4gPj4gICAgICAgICB9Cj4gPj4gICNlbHNlIC8qIENPTkZJR18zMkJJVCAq
Lwo+ID4+ICAgICAgICAgLyogVHJ5IFN2MzJ4NCBHLXN0YWdlIG1vZGUgKi8KPiA+PiAtICAgICAg
IGNzcl93cml0ZShDU1JfSEdBVFAsIEhHQVRQX01PREVfU1YzMlg0IDw8IEhHQVRQX01PREVfU0hJ
RlQpOwo+ID4+IC0gICAgICAgaWYgKChjc3JfcmVhZChDU1JfSEdBVFApID4+IEhHQVRQX01PREVf
U0hJRlQpID09IEhHQVRQX01PREVfU1YzMlg0KSB7Cj4gPj4gKyAgICAgICBpZiAoa3ZtX3Jpc2N2
X2hnYXRwX21vZGVfc3VwcG9ydGVkKEhHQVRQX01PREVfU1YzMlg0KSkgewo+ID4+ICsgICAgICAg
ICAgICAgICBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfbWFzayB8PSBCSVQoSEdBVFBfTU9ERV9TVjMy
WDQpOwo+ID4+ICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfZ3N0YWdlX21heF9wZ2RfbGV2ZWxz
ID0gMjsKPiA+PiAtICAgICAgICAgICAgICAgZ290byBkb25lOwo+ID4+ICAgICAgICAgfQo+ID4+
ICAjZW5kaWYKPiA+Pgo+ID4+IC0gICAgICAgLyogS1ZNIGRlcGVuZHMgb24gIUhHQVRQX01PREVf
T0ZGICovCj4gPj4gLSAgICAgICBrdm1fcmlzY3ZfZ3N0YWdlX21heF9wZ2RfbGV2ZWxzID0gMDsK
PiA+PiAtCj4gPj4gLWRvbmU6Cj4gPgo+ID5IZXJlIGFyZSBzb21lIHN0YXRlbWVudHMgZnJvbSBS
SVNDLVYgcHJpdmlsZWdlIHNwZWNpZmljYXRpb246Cj4gPiJJbXBsZW1lbnRhdGlvbnMgdGhhdCBz
dXBwb3J0IFN2NDggbXVzdCBhbHNvIHN1cHBvcnQgU3YzOS4iCj4gPiJJbXBsZW1lbnRhdGlvbnMg
dGhhdCBzdXBwb3J0IFN2NTcgbXVzdCBhbHNvIHN1cHBvcnQgU3Y0OC4iCj4gPiJUaGUgY29udmVy
c2lvbiBvZiBhbiBTdjMyeDQsIFN2Mzl4NCwgU3Y0OHg0LCBvciBTdjU3eDQgZ3Vlc3QgcGh5c2lj
YWwKPiA+YWRkcmVzcyBpcyBhY2NvbXBsaXNoZWQgd2l0aCB0aGUKPiA+c2FtZSBhbGdvcml0aG0g
dXNlZCBmb3IgU3YzMiwgU3YzOSwgU3Y0OCwgb3IgU3Y1NywgYXMgcHJlc2VudGVkIGluCj4gPlNl
Y3Rpb24gMTIuMy4yLCBleGNlcHQgdGhhdDoiCj4gPiJoZ2F0cCBzdWJzdGl0dXRlcyBmb3IgdGhl
IHVzdWFsIHNhdHA7Igo+ID4KPiA+QmFzZWQgb24gYWJvdmUgaXQgaXMgYSB3YXN0ZSB0byB0cnkg
ZWFjaCBhbmQgZXZlcnkgbW9kZS4KPiA+Rm9yIGV4YW1wbGU6IGlmIG1vZGUgU3Y0OHg0IGlzIHN1
cHBvcnRlZCB0aGVuIFN2Mzl4NCBpcyBhbHNvIHN1cHBvcnRlZC4KPiA+Cj4KPiBSYWRtaSBhbmQg
SSBkaXNjdXNzZWQgdGhpcyB0b3BpYyBiZWZvcmU7IHBsZWFzZSByZWZlciB0byB0aGUgZm9sbG93
aW5nIGxpbms6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNjAxMzEw
NjEyMzguNTI3MDgtMS1mYW5neXUueXVAbGludXguYWxpYmFiYS5jb20vCgpQcml2aWxlZ2Ugc3Bl
YyBtYW5kYXRlcyBTdjQ4IGFuZCBTdjM5IHdoZW4gU3Y1NyBpcyBzdXBwb3J0ZWQKc28gdGhlIGN1
cnJlbnQgYXBwcm9hY2ggaXMgbm90IGJhc2VkIG9uIGFueSBhc3N1bXB0aW9uLgoKUmVnYXJkcywK
QW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlz
Y3YK
