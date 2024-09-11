From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 11 Sep 2024 10:15:14 +0200
Subject: [kvm-unit-tests PATCH 1/2] configure: Introduce add-config
In-Reply-To: <D431AYECDJV3.1AVQCTIRV2J4G@gmail.com>
References: <20240903143946.834864-4-andrew.jones@linux.dev>
 <20240903143946.834864-5-andrew.jones@linux.dev>
 <D431AYECDJV3.1AVQCTIRV2J4G@gmail.com>
Message-ID: <20240911-d6ec4d38091c5f852f825d17@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 11, 2024 at 10:39:03AM GMT, Nicholas Piggin wrote:
> On Wed Sep 4, 2024 at 12:39 AM AEST, Andrew Jones wrote:
> > Allow users to add additional CONFIG_* and override defaults
> > by concatenating a given file with #define's and #undef's to
> > lib/config.h
> 
> That's a horrible config format lol, but probbaly the simplest way to
> get something working. What if you included the user config first, then
> make the generated config test ifndef before defining the default?

User config first and then #ifndef would indeed be better.

> 
> Is it better to have a config file than to just add more --options to
> configure? If we had thousands of options maybe, but so far we are
> getting by with configure options.

I have some unposted patches where I introduce two more configs, which
is what inspired me to stop adding configure command line options.

> I think I prefer that for now
> unless we wholesale moved everything to a .config style.

Moving to .config would be good, and importing and applying Kconfiglib
doesn't look too daunting either. We can put this --add-config idea on
hold until we've had a chance to experiment.

Thanks,
drew

