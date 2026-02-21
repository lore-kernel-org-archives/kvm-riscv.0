Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C260C61DE4
	for <kvm-riscv@archiver.kernel.org>; Sat, 21 Feb 2026 10:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lzcHPvKga9RNvUnTjla+JzgyIIViidN5mGI/iw2FyhI=; b=ViTJgoFYaWE2sj
	lHaSzBopD2PuG0Onlj0fbo3+/sC5jludfdbeJlEqWMty2nlQaqaak8/fXlpKWC5z4NfnwA45dpoRn
	crPdF/V/xsZDya5HG89z5gCDDXpSAssLWrTtHxvcbHNCJM673x+aBp5nRvI/K3ztVGcFaJScPq8ga
	S5MhNL7dBo/vUpq+0nspr00wqBxSUCtQ1/EgRRt6xqbpO9larEqGmoJxEtUnDalKEVAAtv0f6Bwd2
	loW/heRQSjP6ZnW1KsvoPl2fKa6dxAGk4Iwgm02LmwLL4fIyA4WO18c9tMeieE7Z6CfxJyne3rBMk
	V63jkFGL/YeyKEvwlvgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtkZM-0000000FzQV-3CI3;
	Sat, 21 Feb 2026 10:50:40 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtkZJ-0000000FzPG-3JRt
	for kvm-riscv@lists.infradead.org;
	Sat, 21 Feb 2026 10:50:39 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-649db2b6cdcso2497759d50.0
        for <kvm-riscv@lists.infradead.org>; Sat, 21 Feb 2026 02:50:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771671037; cv=none;
        d=google.com; s=arc-20240605;
        b=D2J9Vk/uWArERZAyrV1g3BIK1XESTN9CUA/iujoGIjoNFmJmvM81z7qtT8OVamOKnO
         +6tx1fNXbciIIAmnaRtcAyeAi7xfADoKOIqIZF2E3k4dzy5YLWcnvT9hbuTGrEMmAcTB
         qPOSykap8YKDInMCWz1VA8LAzGnYzGNqdGwIdS4byChnwVvbdobxCk852RJZXpD8X4+K
         l9v5uZCEeGXUA7zb2WHtyS0AAGReBeiY4nSfTv1OUSMZNZwpmu5VHkUMKyZEnhiKHNDG
         sFgbNRQ7rOBFNRQfXc4Kns+XsS2ZtOiUR3GpdTdDfzz5gxLt09iUl4bPWBSdzgXV3F0j
         lXmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q2f5G2rg3qi7MhEp+r/8jZhzV4dnFuC38j3G1iQE75w=;
        fh=bGTMVsCeVpUOwkEswVbeE7P60uwbUCf2OQG0eV9Ecr0=;
        b=JlGeUhBSu97s+RheOtzPMP3HY50Nj/iI230Qh75vzw3lT1Si1bJdT/2yINSo4X1CS1
         pawfIvUpAjxgpZPOgWORljHVcwNqFL4uPUyKxT6yiWJcJJDpqqPZC11hCDnfyCfCYnEB
         EvrnzxesdNNbhe3hCVOBLyVWzBQYTZOYtxmYYGptzACr7n1k+i7orZko4aSb5MpOJqPu
         JZ+bXHZsd0DjZ3uq9LDXnSyD//NKQQYIv8/NnqK4w83YvxA+6F3wtwkkcfbg9TFtSTAS
         UNCzHKNqSnNdStPoiSvhWsV4xCBTgK9J/xkq6BEwRvKV1Shcl4EMfMd02Fgrm4jXDNEK
         V4gA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1771671037; x=1772275837; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2f5G2rg3qi7MhEp+r/8jZhzV4dnFuC38j3G1iQE75w=;
        b=LsrL+I72QSbvu/XI2JrSAUUcnZMZlk7E8iFsmCfJXFf7kYtsCKM5Axu7Jver3OVLbc
         2ShgBa/jQ3AHrvv9fVlEgu2h/JsCH1kX/cAayEj1sMacFbxRGkU+mzhSusYcSsSyGO/c
         mugLFQPIkFJ8Pvw+05CrCssVnkl1EhDIfk4Bm5/rIHwf+TkMJi2ejSZmmUzpuzlp1lOR
         t1DeNt84PB/RCbi//o02yyVMan2Sy41XDyzmxShRjVmCSdHKTLHoUmCGPKrZ6kU3QZ3d
         3WKz7ZsopIU1WOyeSKPRaZemSPDt70yDsmpCWS1rYm6KrLS+SXak9Sq0iIftkgJMaGpi
         VLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771671037; x=1772275837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q2f5G2rg3qi7MhEp+r/8jZhzV4dnFuC38j3G1iQE75w=;
        b=oCOxFwgHqWT5DFbFbFk2HbbcBbgzVjXqKHvMEKz69EMSklhkFiZVYt/kuZeP5Z0kae
         A1BZtE46KMEPk9OMX4u22Ymb93Ha7P6DbqwRMNoHpji+6QZpq71yINHzAfnKhJtQNDcf
         03nlCqksxTqa4HYr68oARCYN3QQ/4slhh4ZR2Bomsa3JwP8z2JMuznCPy4h3EPkWxv4B
         FRLllrqeQ6ji7xFLNE1hS88ph0OydmefOZq1Gpiwh9j7ZcvZsh1TeP6YeLlbqMQqPbDF
         o2qoeyJWoG0c1Wz1lnn/25Z7ClVpViVucFnT/rgznyUYJoE2bkex84YHI6vJB9wBWeto
         vwxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbvfiXVMbEKXWVT1Ml++nmbXugCX5kvHsRYdEd5vR1WPwb/bKKEbZbbqiDQ+lvjwmS1lPlsdX2ERc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjJl76nYF/cyM4jVYYQX8HZ6v4+9HtePzzUiz0v6kXH9FtD2Kq
	E3CumRcZgxrh1rAXYunRqFPwxvAChSBLl4+ioKmX/7E9UUCh+j0Qj+yByCIlzAYXxIGNOMVREMR
	Fsb0rYxAXE1oUwAjXlo0ukbkB0v7eh6OvTGz8rUZ/uGV9FbyIVYyVgb6bow==
X-Gm-Gg: AZuq6aIjTmSxUsufm6V4A6V3VDcRhjIAE/5sw52ulFjUKy7oFfK2XVEuLbcTLxclnWO
	6NqcPPsfFWrZ2bw4laksxl7hMJ7Gi4pn+tFacfYgUjasDdra+0DvowIKEmHpsUymUdRWjYZNJrO
	WwNue3iqMmvtSuAv5Qrc4cpK/Uxiri7OpmX/yVbAnWTN6Lo4/HMSNk8E6G83rZ2TJTWJcDbGTGm
	fPFGxWcroIqRkV8EFHtUTZG+wpFg6ptm62dHECfNOlKW17d+fwFkRtjHQOrCB5/l+l7IVnccWkf
	vTuTtAYJVd58dNNTgb7XjK+Iugl1SNuLnaqdeCwZnXnWEvaj9l4=
X-Received: by 2002:a05:690e:d0c:b0:64a:d672:dafb with SMTP id
 956f58d0204a3-64c786d4a57mr2291396d50.8.1771671036674; Sat, 21 Feb 2026
 02:50:36 -0800 (PST)
MIME-Version: 1.0
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com> <20260206002349.96740-7-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260206002349.96740-7-andrew.jones@oss.qualcomm.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 21 Feb 2026 18:50:25 +0800
X-Gm-Features: AaiRm51cgwMJFQ0952LFumXiI3OMCVwstsOKZrpL5GJ8dn6NfkhuWZT_8qkZOws
Message-ID: <CAH1PCMbNZC_VkNBKPHcFLRa5jh3naa_-EnER4_e5U99D054QXw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 06/11] riscv: Add Ziccamoa, Ziccif, Ziccrse, and
 Za64rs to hwprobe
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Charlie Jenkins <thecharlesjenkins@gmail.com>, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_025037_842058_E03D9702 
X-CRM114-Status: GOOD (  22.10  )
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

T24gRnJpLCBGZWIgNiwgMjAyNiBhdCA4OjI04oCvQU0gQW5kcmV3IEpvbmVzCjxhbmRyZXcuam9u
ZXNAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBaaWNjcnNlIGlzIGFscmVhZHkgcHJlc2Vu
dCBpbiBjcHVmZWF0dXJlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxhbmRyZXcu
am9uZXNAb3NzLnF1YWxjb21tLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2
L2h3cHJvYmUucnN0ICB8IDE2ICsrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9od2NhcC5oICAgICAgICB8ICAzICsrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oIHwgIDQgKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMg
ICAgICAgIHwgIDMgKysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgICAgICAg
fCAgNyArKysrKy0tCj4gIDUgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9i
ZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiBpbmRleCA0NDg0
ZjJhN2Y3OTguLjk3MjI2YjdjNTkzNiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gv
cmlzY3YvaHdwcm9iZS5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9i
ZS5yc3QKPiBAQCAtMzk1LDMgKzM5NSwxOSBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRlZmlu
ZWQ6Cj4gICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0lNQV9FWFRfMWA6IEEgYml0bWFz
ayBjb250YWluaW5nIGFkZGl0aW9uYWwKPiAgICBleHRlbnNpb25zIHRoYXQgYXJlIGNvbXBhdGli
bGUgd2l0aCB0aGUKPiAgICA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9CQVNFX0JFSEFWSU9SX0lN
QWA6IGJhc2Ugc3lzdGVtIGJlaGF2aW9yLgo+ICsKPiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BS
T0JFX0VYVF9aSUNDQU1PQWA6IFRoZSBaaWNjYW1vYSBleHRlbnNpb24gaXMgc3VwcG9ydGVkLAo+
ICsgICAgYXMgZGVmaW5lZCBpbiB0aGUgUklTQy1WIFByb2ZpbGVzIHNwZWNpZmljYXRpb24gc3Rh
cnRpbmcgZnJvbSBjb21taXQKPiArICAgIGIxZDgwNjYwICgiVXBkYXRlZCB0byByYXRpZmllZCBz
dGF0ZS4iKQo+ICsKPiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aSUNDSUZgOiBU
aGUgWmljY2lmIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQsCj4gKyAgICBhcyBkZWZpbmVkIGluIHRo
ZSBSSVNDLVYgUHJvZmlsZXMgc3BlY2lmaWNhdGlvbiBzdGFydGluZyBmcm9tIGNvbW1pdAo+ICsg
ICAgYjFkODA2NjAgKCJVcGRhdGVkIHRvIHJhdGlmaWVkIHN0YXRlLiIpCj4gKwo+ICsgICogOmM6
bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pJQ0NSU0VgOiBUaGUgWmljY3JzZSBleHRlbnNpb24g
aXMgc3VwcG9ydGVkLAo+ICsgICAgYXMgZGVmaW5lZCBpbiB0aGUgUklTQy1WIFByb2ZpbGVzIHNw
ZWNpZmljYXRpb24gc3RhcnRpbmcgZnJvbSBjb21taXQKPiArICAgIGIxZDgwNjYwICgiVXBkYXRl
ZCB0byByYXRpZmllZCBzdGF0ZS4iKQo+ICsKPiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JF
X0VYVF9aQTY0UlNgOiBUaGUgWmE2NHJzIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQsCj4gKyAgICBh
cyBkZWZpbmVkIGluIHRoZSBSSVNDLVYgUHJvZmlsZXMgc3BlY2lmaWNhdGlvbiBzdGFydGluZyBm
cm9tIGNvbW1pdAo+ICsgICAgYjFkODA2NjAgKCJVcGRhdGVkIHRvIHJhdGlmaWVkIHN0YXRlLiIp
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+IGluZGV4IGMxN2UxMWNhY2E4My4uOGU3NjRkYmM3NDEz
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+ICsrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+IEBAIC0xMTIsNiArMTEyLDkgQEAKPiAgI2Rl
ZmluZSBSSVNDVl9JU0FfRVhUX1pJTFNEICAgICAgICAgICAgMTAyCj4gICNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9aQ0xTRCAgICAgICAgICAgIDEwMwo+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklD
Q0xTTSAgICAgICAgICAxMDQKPiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJQ0NBTU9BICAgICAg
ICAgMTA1Cj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUNDSUYgICAgICAgICAgIDEwNgo+ICsj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkE2NFJTICAgICAgICAgICAxMDcKPgo+ICAjZGVmaW5lIFJJ
U0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZHICAgICAxMjcKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2h3cHJvYmUuaAo+IGluZGV4IDZhMDE2M2I1NDcxOC4uZmVkOWVhNmZkMmI1IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gQEAgLTExNSw2ICsxMTUsMTAgQEAg
c3RydWN0IHJpc2N2X2h3cHJvYmUgewo+ICAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX1ZFTkRP
Ul9FWFRfTUlQU18wICAgIDE0Cj4gICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfWklDQk9QX0JM
T0NLX1NJWkUgICAgMTUKPiAgI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9JTUFfRVhUXzEgICAg
ICAgICAgICAxNgo+ICsjZGVmaW5lICAgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pJ
Q0NBTU9BICAgICAgKDEgPDwgMCkKPiArI2RlZmluZSAgICAgICAgICAgICAgICBSSVNDVl9IV1BS
T0JFX0VYVF9aSUNDSUYgICAgICAgICgxIDw8IDEpCj4gKyNkZWZpbmUgICAgICAgICAgICAgICAg
UklTQ1ZfSFdQUk9CRV9FWFRfWklDQ1JTRSAgICAgICAoMSA8PCAyKQo+ICsjZGVmaW5lICAgICAg
ICAgICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pBNjRSUyAgICAgICAgKDEgPDwgMykKPiAgLyog
SW5jcmVhc2UgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIHdoZW4gYWRkaW5nIGl0ZW1zLiAqLwo+Cj4g
IC8qIEZsYWdzICovCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+IGluZGV4IGNhN2EzNGY2NjczOC4u
YjAwMWU3OGVlY2Y2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
Ywo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+IEBAIC00ODgsNiArNDg4
LDggQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7
Cj4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVRfVkFMSURBVEUoemljYm9tLCBSSVND
Vl9JU0FfRVhUX1pJQ0JPTSwgcmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHMsIHJpc2N2X2V4dF96aWNi
b21fdmFsaWRhdGUpLAo+ICAgICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEFfVkFMSURBVEUoemlj
Ym9wLCBSSVNDVl9JU0FfRVhUX1pJQ0JPUCwgcmlzY3ZfZXh0X3ppY2JvcF92YWxpZGF0ZSksCj4g
ICAgICAgICBfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVRfVkFMSURBVEUoemljYm96LCBSSVNDVl9J
U0FfRVhUX1pJQ0JPWiwgcmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHMsIHJpc2N2X2V4dF96aWNib3pf
dmFsaWRhdGUpLAo+ICsgICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoemljY2Ftb2EsIFJJU0NW
X0lTQV9FWFRfWklDQ0FNT0EpLAoKSXQgbWlnaHQgYmUgZ29vZCB0byBhbHNvIGVuZm9yY2UgZXh0
ZW5zaW9uIGRlcGVuZGVuY2llcyBoZXJlOgpaYTY0cnMgZGVwZW5kcyBvbiBaYWxyc2MsIGFuZCBa
aWNjYW1vYSBkZXBlbmRzIG9uIFphYW1vLiBJIGRpZApzb21ldGhpbmcgc2ltaWxhciBpbiBteSBz
ZXJpZXMgWzFdLiBMaWtlIHRoaXM6CgorIF9fUklTQ1ZfSVNBX0VYVF9EQVRBX1ZBTElEQVRFKHpp
Y2NhbW9hLCBSSVNDVl9JU0FfRVhUX1pJQ0NBTU9BLApyaXNjdl9leHRfemFhbW9fZGVwZW5kcyks
CgpJZiB5b3UgYWdyZWUsIEkgY2FuIHByZXBhcmUgYSBzdGFuZGFsb25lIHBhdGNoIGFkZGluZyB0
aGVzZSBkZXBlbmRlbmN5CmNoZWNrcyBhbmQgc2VuZCBpdCB5b3VyIHdheS4KCj4gKyAgICAgICBf
X1JJU0NWX0lTQV9FWFRfREFUQSh6aWNjaWYsIFJJU0NWX0lTQV9FWFRfWklDQ0lGKSwKPiAgICAg
ICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppY2Nsc20sIFJJU0NWX0lTQV9FWFRfWklDQ0xTTSks
Cj4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWNjcnNlLCBSSVNDVl9JU0FfRVhUX1pJ
Q0NSU0UpLAo+ICAgICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoemljbnRyLCBSSVNDVl9JU0Ff
RVhUX1pJQ05UUiksCj4gQEAgLTQ5OCw2ICs1MDAsNyBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNh
X2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKPiAgICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHppaGludHBhdXNlLCBSSVNDVl9JU0FfRVhUX1pJSElOVFBBVVNFKSwKPiAgICAgICAgIF9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHppaHBtLCBSSVNDVl9JU0FfRVhUX1pJSFBNKSwKPiAgICAgICAg
IF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppbW9wLCBSSVNDVl9JU0FfRVhUX1pJTU9QKSwKPiArICAg
ICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHphNjRycywgUklTQ1ZfSVNBX0VYVF9aQTY0UlMpLAoK
QW5kIGFkZCBkZXBlbmRlbmN5IGhlcmUgZm9yIHphNjRyczoKKyAgICAgICBfX1JJU0NWX0lTQV9F
WFRfREFUQV9WQUxJREFURSh6YTY0cnMsIFJJU0NWX0lTQV9FWFRfWkE2NFJTLApyaXNjdl9leHRf
emFscnNjX2RlcGVuZHMpLAoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYw
MjA3LWlzYS1leHQtcGFyc2UtZXhwb3J0LXYxLTQtYTY0ZDNhOGJjMjBhQHJpc2NzdGFyLmNvbS8K
WzFdCgpCUiwKR3VvZG9uZwoKCkd1b2RvbmcKCj4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFU
QSh6YWFtbywgUklTQ1ZfSVNBX0VYVF9aQUFNTyksCj4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRf
REFUQSh6YWJoYSwgUklTQ1ZfSVNBX0VYVF9aQUJIQSksCj4gICAgICAgICBfX1JJU0NWX0lTQV9F
WFRfREFUQSh6YWNhcywgUklTQ1ZfSVNBX0VYVF9aQUNBUyksCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9i
ZS5jCj4gaW5kZXggNzZlNjczYWI0MmE1Li4zMWQyMjIzMDFiZjAgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5
c19od3Byb2JlLmMKPiBAQCAtMTk2LDcgKzE5Niw3IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNh
X2V4dDEoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCj4gICAgICAgICAgKiBkb2Vzbid0IGhh
dmUuCj4gICAgICAgICAgKi8KPiAgICAgICAgIGZvcl9lYWNoX2NwdShjcHUsIGNwdXMpIHsKPiAt
ICAgICAgICAgICAgICAgLyogc3RydWN0IHJpc2N2X2lzYWluZm8gKmlzYWluZm8gPSAmaGFydF9p
c2FbY3B1XTsgKi8KPiArICAgICAgICAgICAgICAgc3RydWN0IHJpc2N2X2lzYWluZm8gKmlzYWlu
Zm8gPSAmaGFydF9pc2FbY3B1XTsKPgo+ICAgICAgICAgICAgICAgICAvKgo+ICAgICAgICAgICAg
ICAgICAgKiBPbmx5IHVzZSBFWFRfS0VZKCkgZm9yIGV4dGVuc2lvbnMgd2hpY2ggY2FuIGJlCj4g
QEAgLTIwNCw3ICsyMDQsMTAgQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0MShzdHJ1Y3Qg
cmlzY3ZfaHdwcm9iZSAqcGFpciwKPiAgICAgICAgICAgICAgICAgICogY29uZmlndXJhdGlvbiwg
YXMgbm8gb3RoZXIgY2hlY2tzLCBiZXNpZGVzIHByZXNlbmNlCj4gICAgICAgICAgICAgICAgICAq
IGluIHRoZSBoYXJ0X2lzYSBiaXRtYXAsIGFyZSBtYWRlLgo+ICAgICAgICAgICAgICAgICAgKi8K
PiAtICAgICAgICAgICAgICAgLyogTm90aGluZyBoZXJlIHlldCAqLwo+ICsgICAgICAgICAgICAg
ICBFWFRfS0VZKGlzYWluZm8tPmlzYSwgWklDQ0FNT0EsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsK
PiArICAgICAgICAgICAgICAgRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpJQ0NJRiwgcGFpci0+dmFs
dWUsIG1pc3NpbmcpOwo+ICsgICAgICAgICAgICAgICBFWFRfS0VZKGlzYWluZm8tPmlzYSwgWklD
Q1JTRSwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+ICsgICAgICAgICAgICAgICBFWFRfS0VZKGlz
YWluZm8tPmlzYSwgWkE2NFJTLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Cj4gICAgICAgICB9Cj4K
PiAgICAgICAgIC8qIE5vdyB0dXJuIG9mZiByZXBvcnRpbmcgZmVhdHVyZXMgaWYgYW55IENQVSBp
cyBtaXNzaW5nIGl0LiAqLwo+IC0tCj4gMi40My4wCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBs
aXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
