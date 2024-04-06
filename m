From: Andrew Jones <andrew.jones@linux.dev>
Date: Sat, 6 Apr 2024 09:30:02 +0200
Subject: [kvm-unit-tests RFC PATCH 17/17] shellcheck: Suppress various
 messages
In-Reply-To: <D0CTUKHP4IZV.2OQZNUD6J9U1P@gmail.com>
References: <20240405090052.375599-1-npiggin@gmail.com>
 <20240405090052.375599-18-npiggin@gmail.com>
 <20240405-7c0ad5d3ce76e1ad9ad2f5a9@orel>
 <D0CTUKHP4IZV.2OQZNUD6J9U1P@gmail.com>
Message-ID: <20240406-35a566d73057343e596e0fc9@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Apr 06, 2024 at 04:31:17PM +1000, Nicholas Piggin wrote:
...
> > > diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> > > index 3b76aec9e..c87613b96 100644
> > > --- a/scripts/runtime.bash
> > > +++ b/scripts/runtime.bash
> > > @@ -137,6 +137,8 @@ function run()
> > >      # the check line can contain multiple files to check separated by a space
> > >      # but each check parameter needs to be of the form <path>=<value>
> > >      if [ "$check" ]; then
> > > +        # There is no globbing allowed in the check parameter.
> > > +        # shellcheck disable=SC2206
> > >          check=($check)
> >
> > Hmm, I'm not sure about this one. $check is an arbitrary path, which means
> > it can have spaces, then =, and then an arbitrary value, which means it can
> > contain spaces. If there are multiple check path=value pairs then
> > separation by space is a bad idea, and any deliminator really is. It seems
> > like each pair should be quoted, i.e.
> >
> >  check = "path1=value1" "path2=value2"
> >
> > and then that should be managed here.
> 
> Yeah I did think of that, valid paths could also have = and ", and even
> with double quotes it seems to be tricky to handle spaces.
> 
> Maybe I'll just add to the unittest.cfg docs to stick with alphanumeric
> paths, and we can improve it if someone complains?

Works for me.

Thanks,
drew

